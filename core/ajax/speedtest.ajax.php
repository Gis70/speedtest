<?php

/* This file is part of Jeedom.
 *
 * Jeedom is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Jeedom is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Jeedom. If not, see <http://www.gnu.org/licenses/>.
 */

try {
	require_once dirname(__FILE__) . '/../../../../core/php/core.inc.php';
	include_file('core', 'authentification', 'php');

	if (!isConnect('admin')) {
		throw new Exception(__('401 - Accès non autorisé', __FILE__));
	}
	ajax::init();
	if (init('action') == 'setInfo') {
		$datas = json_decode(init('datas'));
		$return = array('ip' => '','arch'=> '');
		try {
			$return['ip'] = speedtest::getIp();
			$return['arch'] = speedtest::getArch();
		} catch (exception $exc) {
			log::add(__CLASS__,'debug','Erreur récupération config : ' . $exc);
		}
		ajax::success($return);
	}
	throw new Exception(__('Aucune methode correspondante à : ', __FILE__) . init('action'));
/*     * *********Catch exception*************** */
} catch (Exception $e) {
	ajax::error(displayException($e), $e->getCode());
}
?>
