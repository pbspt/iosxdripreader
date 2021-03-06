/**
 Copyright (C) 2017  Johan Degraeve
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/gpl.txt>.
 
 */package databaseclasses
 {
 	import flash.events.EventDispatcher;
 	
 	import G4Model.TransmitterStatus;
 	
 	import events.SettingsServiceEvent;
 	
 	import model.ModelLocator;

	 /**
	  * common settings are settings that are shared with other devices, ie settings that will be synchronized
	  */
	 public class CommonSettings extends EventDispatcher
	 {
		 [ResourceBundle("settingsview")]
		 
		 private static var _instance:CommonSettings = new CommonSettings();

		 public static function get instance():CommonSettings
		 {
			 return _instance;
		 }
		 
		 /**
		 * Witout https:// and without /api/v1/treatments<br>
		  */
		 public static const DEFAULT_SITE_NAME:String = "YOUR_SITE.azurewebsites.net";
		 public static const DEFAULT_API_SECRET:String = "API_SECRET";
		 
		 //LIST OF SETTINGID's
		 /**
		  * Unique Id of the currently active sensor<br>
		  * value "0" means there's no sensor active
		  *  
		  */
		 public static const COMMON_SETTING_CURRENT_SENSOR:int = 0; 
		 /**
		  * transmitter battery level (ie 215, 214,...)<br>
		  * 0 means level not known
		  */
		 public static const COMMON_SETTING_G4_TRANSMITTER_BATTERY_VOLTAGE:int = 1;
		 /**
		  * bridge battery level<br>
		  * 0 means level not known
		  */
		 public static const COMMON_SETTING_BRIDGE_BATTERY_PERCENTAGE:int = 2;
		 public static const COMMON_SETTING_G4_INFO_SCREEN_SHOWN:int = 3;
		 /**
		  * Witout https:// and without /api/v1/treatments<br>
		  */
		 public static const COMMON_SETTING_AZURE_WEBSITE_NAME:int = 4;
		 public static const COMMON_SETTING_API_SECRET:int = 5;
		 public static const COMMON_SETTING_URL_AND_API_SECRET_TESTED:int = 6; 
		 /**
		 * 0 = never synced 
		  */
		 public static const COMMON_SETTING_NIGHTSCOUT_SYNC_TIMESTAMP:int = 7;
		 /**
		 * not used anymore
		  */
		 public static const COMMON_SETTING_ADDITIONAL_CALIBRATION_REQUEST_ALERT:int = 8;
		 /**
		 * true or false, if true unit is mg/dl 
		  */
		 public static const COMMON_SETTING_DO_MGDL:int = 9;
		 /**
		 * low bg value, in mgdl, should be converted each time it is used or displayed
		  */
		 public static const COMMON_SETTING_LOW_MARK:int = 10;
		 /**
		 * high bg value, in mgdl, should be converted each time it is used or displayed
		  */
		 public static const COMMON_SETTING_HIGH_MARK:int = 11;
		 /**
		 * transmitter id, 00000 is not set 
		 */
		 public static const COMMON_SETTING_TRANSMITTER_ID:int = 12;
		 /**
		 * last update TRANSMITTER_BATTERY_VOLTAGE in ms since 1 1 1970<br>
		 * updated automatically when the setting COMMON_SETTING_TRANSMITTER_BATTERY_VOLTAGE
		  */
		 public static const COMMON_SETTING_UNUSED:int = 13;
		 public static const COMMON_SETTING_G5_BATTERY_MARKER:int = 14;
		 public static const COMMON_SETTING_G5_BATTERY_FROM_MARKER:int = 15;
		 /**
		 * G4 or G5, also for limitter G4 is used
		  */
		 public static const COMMON_SETTING_PERIPHERAL_TYPE:int = 16;
		 public static const COMMON_SETTING_G5_INFO_SCREEN_SHOWN:int = 17;
		 public static const COMMON_SETTING_INITIAL_SELECTION_G4_OR_G5_DONE:int = 18;
		 public static const COMMON_SETTING_LICENSE_INFO_CONFIRMED:int = 19;
		 /**
		 * only related to quickblox subscription in iosxdripreader.mxml activateHandler 
		  */
		 public static const COMMON_SETTING_TIME_SINCE_LAST_QUICK_BLOX_SUBSCRIPTION:int = 20;
		 /**
		 * the string that has all the intervals with low alert types 
		  */
		 public static const COMMON_SETTING_LOW_ALERT:int = 21;
		 /**
		 * the string that has all the intervals with high alert types 
		  */
		 public static const COMMON_SETTING_HIGH_ALERT:int = 22;
		 /**
		  * the string that has all the intervals with missed reading alert types 
		  */
		 public static const COMMON_SETTING_MISSED_READING_ALERT:int = 23;
		 /**
		  * the string that has all the intervals with phone muted alert types
		  */
		 public static const COMMON_SETTING_PHONE_MUTED_ALERT:int = 24;
		 /**
		 * Not used anymore
		  */
		 public static const COMMON_SETTING_G5_STATUS:int = 25;
		 /**
		  * data read from g5 transmitter, default value 'unknown'
		  */
		 public static const COMMON_SETTING_G5_VOLTAGEA:int = 26;
		 /**
		  * data read from g5 transmitter, default value 'unknown'
		  */
		 public static const COMMON_SETTING_G5_VOLTAGEB:int = 27;
		 /**
		  * data read from g5 transmitter, default value 'unknown'
		  */
		 public static const COMMON_SETTING_G5_RESIST:int = 28;
		 /**
		  * data read from g5 transmitter, default value 'unknown'
		  */
		 public static const COMMON_SETTING_G5_TEMPERATURE:int = 29;
		 /**
		  * data read from g5 transmitter, default value 'unknown'
		  */
		 public static const COMMON_SETTING_G5_RUNTIME:int = 30;
		 
		 /**
		  * the string that has all the intervals with battery low alert types
		  */
		 public static const COMMON_SETTING_BATTERY_ALERT:int = 31;
		 public static const COMMON_SETTING_CALIBRATION_REQUEST_ALERT:int = 32;
		 public static const COMMON_SETTING_VERY_LOW_ALERT:int = 33;
		 public static const COMMON_SETTING_VERY_HIGH_ALERT:int = 34;

		 private static var commonSettings:Array = [
			 "0",//COMMON_SETTING_CURRENT_SENSOR
			 "0",//COMMON_SETTING_G4_TRANSMITTER_BATTERY_VOLTAGE
			 "0",//COMMON_SETTING_BRIDGE_BATTERY_PERCENTAGE
			 "false",//COMMON_SETTING_G4_INFO_SCREEN_SHOWN
			 DEFAULT_SITE_NAME,//COMMON_SETTING_AZURE_WEBSITE_NAME
			 DEFAULT_API_SECRET,//COMMON_SETTING_API_SECRET
			 "false",//COMMON_SETTING_URL_AND_API_SECRET_TESTED
			 "0",//COMMON_SETTING_NIGHTSCOUT_SYNC_TIMESTAMP
			 "true",//COMMON_SETTING_ADDITIONAL_CALIBRATION_REQUEST_ALERT -- not used anymore
			 "true",//COMMON_SETTING_DO_MGDL
			 "70",//COMMON_SETTING_LOW_MARK
			 "170",//COMMON_SETTING_HIGH_MARK
			 "00000",//COMMON_SETTING_TRANSMITTER_ID
			 "0",//COMMON_SETTING_UNUSED
			 "",//COMMON_SETTING_G5_BATTERY_MARKER
			 "0",//COMMON_SETTING_G5_BATTERY_FROM_MARKER
			 "",//COMMON_SETTING_PERIPHERAL_TYPE
			 "false",//COMMON_SETTING_G5_INFO_SCREEN_SHOWN
			 "false",//COMMON_SETTING_INITIAL_SELECTION_G4_OR_G5_DONE
			 "false",//COMMON_SETTING_LICENSE_INFO_CONFIRMED
			 "0",//COMMON_SETTING_TIME_SINCE_LAST_QUICK_BLOX_SUBSCRIPTION
			 "00:00>70>DefaultNoAlertToBeReplaced",//COMMON_SETTING_LOW_ALERT
			 "00:00>170>DefaultNoAlertToBeReplaced",//COMMON_SETTING_HIGH_ALERT
			 "00:00>30>DefaultNoAlertToBeReplaced",//COMMON_SETTING_MISSED_READING_ALERT
			 "00:00>0>DefaultNoAlertToBeReplaced-21:00>0>SilentToBeReplaced",//COMMON_SETTING_PHONE_MUTED_ALERT
			 "unknown",//COMMON_SETTING_G5_STATUS
			 "unknown",//COMMON_SETTING_G5_VOLTAGEA
			 "unknown",//COMMON_SETTING_G5_VOLTAGEB
			 "unknown",//COMMON_SETTING_G5_RESIST
			 "unknown",//COMMON_SETTING_G5_TEMPERATURE
			 "unknown",//COMMON_SETTING_G5_RUNTIME
			 "00:00>DefaultValue>DefaultNoAlertToBeReplaced-08:00>DefaultValue>SilentToBeReplaced",//COMMON_SETTING_BATTERY_ALERT
			 "00:00>12>DefaultNoAlertToBeReplaced-08:00>12>SilentToBeReplaced-23:00>12>DefaultNoAlertToBeReplaced",//COMMON_SETTING_CALIBRATION_REQUEST_ALERT
			 "00:00>50>DefaultNoAlertToBeReplaced",//COMMON_SETTING_VERY_LOW_ALERT
			 "00:00>300>DefaultNoAlertToBeReplaced"//COMMON_SETTING_VERY_HIGH_ALERT
		 ];
		 
		 public function CommonSettings()
		 {
			 if (_instance != null) {
				 throw new Error("CommonSettings class  constructor can not be used");	
			 }
		 }
		 
		 public static function getCommonSetting(commonSettingId:int):String {
			 var noAlert:String;
			 var newString:String;
			 if (commonSettingId == COMMON_SETTING_BATTERY_ALERT) {
				 if ((commonSettings[COMMON_SETTING_BATTERY_ALERT] as String).indexOf('DefaultValue') > -1) {
					 newString = (commonSettings[COMMON_SETTING_BATTERY_ALERT] as String)
						 .replace('DefaultValue', TransmitterStatus.TRANSMITTER_BATTERY_LOW);
					 setCommonSetting(COMMON_SETTING_BATTERY_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_LOW_ALERT) {
				 if ((commonSettings[COMMON_SETTING_LOW_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_LOW_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_LOW_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_VERY_LOW_ALERT) {
				 if ((commonSettings[COMMON_SETTING_VERY_LOW_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_VERY_LOW_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_VERY_LOW_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_VERY_HIGH_ALERT) {
				 if ((commonSettings[COMMON_SETTING_VERY_HIGH_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_VERY_HIGH_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_VERY_HIGH_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_HIGH_ALERT) {
				 if ((commonSettings[COMMON_SETTING_HIGH_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_HIGH_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_HIGH_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_MISSED_READING_ALERT) {
				 if ((commonSettings[COMMON_SETTING_MISSED_READING_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_MISSED_READING_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_MISSED_READING_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_PHONE_MUTED_ALERT) {
				 if ((commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_PHONE_MUTED_ALERT, newString);
				 }
				 if ((commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String).indexOf('SilentToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","silent_alert")
					 newString = (commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String)
						 .replace('SilentToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_PHONE_MUTED_ALERT, newString);
				 }
				 if ((commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String).indexOf('SilentPhoneMutedToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","silent_alert")
					 newString = (commonSettings[COMMON_SETTING_PHONE_MUTED_ALERT] as String)
						 .replace('SilentPhoneMutedToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_PHONE_MUTED_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_BATTERY_ALERT) {
				 if ((commonSettings[COMMON_SETTING_BATTERY_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_BATTERY_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_BATTERY_ALERT, newString);
				 }
				 if ((commonSettings[COMMON_SETTING_BATTERY_ALERT] as String).indexOf('SilentToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","silent_alert")
					 newString = (commonSettings[COMMON_SETTING_BATTERY_ALERT] as String)
						 .replace('SilentToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_BATTERY_ALERT, newString);
				 }
				 if ((commonSettings[COMMON_SETTING_BATTERY_ALERT] as String).indexOf('SilentPhoneMutedToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","silent_alert")
					 newString = (commonSettings[COMMON_SETTING_BATTERY_ALERT] as String)
						 .replace('SilentPhoneMutedToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_BATTERY_ALERT, newString);
				 }
			 }
			 if (commonSettingId == COMMON_SETTING_CALIBRATION_REQUEST_ALERT) {
				 if ((commonSettings[COMMON_SETTING_CALIBRATION_REQUEST_ALERT] as String).indexOf('DefaultNoAlertToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","no_alert")
					 newString = (commonSettings[COMMON_SETTING_CALIBRATION_REQUEST_ALERT] as String)
						 .replace('DefaultNoAlertToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_CALIBRATION_REQUEST_ALERT, newString);
				 }
				 if ((commonSettings[COMMON_SETTING_CALIBRATION_REQUEST_ALERT] as String).indexOf('SilentToBeReplaced') > -1) {
					 noAlert = ModelLocator.resourceManagerInstance.getString("settingsview","silent_alert")
					 newString = (commonSettings[COMMON_SETTING_CALIBRATION_REQUEST_ALERT] as String)
						 .replace('SilentToBeReplaced', noAlert);
					 setCommonSetting(COMMON_SETTING_CALIBRATION_REQUEST_ALERT, newString);
				 }
			 }
			 return commonSettings[commonSettingId];
		 }
		 
		 public static function setCommonSetting(commonSettingId:int, newValue:String, updateDatabase:Boolean = true):void {
			 if (commonSettings[commonSettingId] != newValue) {
				 if (commonSettingId == COMMON_SETTING_TRANSMITTER_ID) {
					 newValue = newValue.toUpperCase();
				 }
				 if (commonSettingId == COMMON_SETTING_G5_BATTERY_MARKER) {
					 commonSettings[COMMON_SETTING_G5_BATTERY_FROM_MARKER] = (new Date()).valueOf();
				 }
				 commonSettings[commonSettingId] = newValue;
				 if (updateDatabase) {
					 Database.updateCommonSetting(commonSettingId, newValue);
					 var settingChangedEvent:SettingsServiceEvent = new SettingsServiceEvent(SettingsServiceEvent.SETTING_CHANGED);
					 settingChangedEvent.data = commonSettingId;
					 _instance.dispatchEvent(settingChangedEvent);
				 }
			 }
		 }
		 
		 public static function getNumberOfSettings():int {
			 return commonSettings.length;
		 }
	 }
 }