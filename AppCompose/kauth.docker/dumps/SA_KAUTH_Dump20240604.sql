CREATE DATABASE  IF NOT EXISTS `keycloak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `keycloak`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.204    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00854cf7-b9e5-40d6-9b84-8cfe9943a596',NULL,NULL,'master','a95c34fa-7af0-4bca-9525-86b2970b6380',1,20,_binary '','a16640af-c710-4c79-ad69-6d26cc644f52',NULL),('0910f43a-9d9d-4baa-a0ef-81ee2bcbdbde',NULL,'registration-page-form','master','8e8ccb81-bb76-4f65-be7c-559eac762f03',0,10,_binary '','7b563019-a177-4687-997a-4c51322941ca',NULL),('0f0d9356-b044-491b-a1bd-203a19326257',NULL,'conditional-user-configured','master','20c33523-f4a8-4f79-94db-a70c5fed13f8',0,10,_binary '\0',NULL,NULL),('1f72f8d2-1536-4049-a130-3d4655a0947b',NULL,'idp-username-password-form','master','ec1376c5-5eba-4144-bbe0-784bbbdd3275',0,10,_binary '\0',NULL,NULL),('21fb7368-e79e-4cba-bbc7-3c29d4a23d53',NULL,'reset-credential-email','master','94515019-d5bb-44f1-8cd7-97f810d12c8c',0,20,_binary '\0',NULL,NULL),('28187789-e073-4054-9fee-59be035c29f6',NULL,'registration-user-creation','master','7b563019-a177-4687-997a-4c51322941ca',0,20,_binary '\0',NULL,NULL),('34c87b0a-540a-4eec-a5dd-614781212fd0',NULL,'reset-credentials-choose-user','master','94515019-d5bb-44f1-8cd7-97f810d12c8c',0,10,_binary '\0',NULL,NULL),('3cb1d446-8016-4ae9-aa1c-3c7bf9295742',NULL,'direct-grant-validate-otp','master','783ec450-e6e4-4484-8c20-09173d197ceb',0,20,_binary '\0',NULL,NULL),('3cfe490a-140c-4bd4-9285-c0cc6010a36f',NULL,'conditional-user-configured','master','783ec450-e6e4-4484-8c20-09173d197ceb',0,10,_binary '\0',NULL,NULL),('490f029f-be73-42fd-9b5f-da0056511b95',NULL,'docker-http-basic-authenticator','master','e18384e3-2f98-4c0e-883c-52eebcaee1aa',0,10,_binary '\0',NULL,NULL),('4fb72030-4192-46de-b769-2bc5b4ad6df4',NULL,'basic-auth-otp','master','b8761b59-1a17-44cb-9f62-874e8964a56a',3,20,_binary '\0',NULL,NULL),('50514894-3137-4b27-901c-fae16304ea0e',NULL,'direct-grant-validate-username','master','86c301b2-1c8d-4a88-abf4-9bf1e49527c5',0,10,_binary '\0',NULL,NULL),('5067dc3e-5adc-4d42-a16d-fd49f60967c2',NULL,'http-basic-authenticator','master','41e35e17-7e3f-401e-8c12-9e9378c1efcb',0,10,_binary '\0',NULL,NULL),('50bd39b8-e19b-44cd-99a1-60f30d06e327',NULL,NULL,'master','41530172-c835-49f5-b790-0a1687865f6c',2,30,_binary '','a95c34fa-7af0-4bca-9525-86b2970b6380',NULL),('56ae2d28-a716-4f1a-85ff-23f510522aee',NULL,'reset-otp','master','20c33523-f4a8-4f79-94db-a70c5fed13f8',0,20,_binary '\0',NULL,NULL),('613596a2-9bb6-4671-b499-7ffab1dd4c75',NULL,NULL,'master','f3597280-8b00-4e5d-baa0-9b17d8ad0b3b',0,20,_binary '','db04d04e-462f-4ab3-81f2-0b9eb145f885',NULL),('6429fdc2-1334-4491-a813-61332d23b60d',NULL,NULL,'master','4b09790d-4da1-4e33-bece-d7afc93462cc',0,20,_binary '','b8761b59-1a17-44cb-9f62-874e8964a56a',NULL),('674b4e4b-e62b-45ab-aeec-a123c0df4bf7',NULL,NULL,'master','86c301b2-1c8d-4a88-abf4-9bf1e49527c5',1,30,_binary '','783ec450-e6e4-4484-8c20-09173d197ceb',NULL),('74c1318b-001d-443c-8de5-b81a50d32a64',NULL,'idp-review-profile','master','f3597280-8b00-4e5d-baa0-9b17d8ad0b3b',0,10,_binary '\0',NULL,'5eb1686c-e76d-4456-b764-7e4e93b96101'),('7d0e0d3b-c141-4246-b87b-6742819620fb',NULL,'registration-password-action','master','7b563019-a177-4687-997a-4c51322941ca',0,50,_binary '\0',NULL,NULL),('7d472fb0-e63c-482c-b6b6-72176f62a8e6',NULL,'reset-password','master','94515019-d5bb-44f1-8cd7-97f810d12c8c',0,30,_binary '\0',NULL,NULL),('87130e4d-e152-4805-b3fd-3de6c736d399',NULL,'auth-otp-form','master','a16640af-c710-4c79-ad69-6d26cc644f52',0,20,_binary '\0',NULL,NULL),('8c83195e-7985-464a-81b3-57e3dd613c77',NULL,'identity-provider-redirector','master','41530172-c835-49f5-b790-0a1687865f6c',2,25,_binary '\0',NULL,NULL),('8f4acd55-f83a-4b8c-a17b-a7a35add5e9e',NULL,'registration-profile-action','master','7b563019-a177-4687-997a-4c51322941ca',0,40,_binary '\0',NULL,NULL),('8f98ce67-1ee3-48b7-a0be-ff95a142d813',NULL,'idp-create-user-if-unique','master','db04d04e-462f-4ab3-81f2-0b9eb145f885',2,10,_binary '\0',NULL,'0c862072-819b-49e9-81ab-d7521497fe08'),('933f8eb5-ed50-4054-90e4-7a7fe1e30c99',NULL,'client-secret-jwt','master','bea2a516-a40e-4356-8d81-fd2b899b2ec5',2,30,_binary '\0',NULL,NULL),('98732dcf-a3e9-4fe3-9dfa-86a5de0e94d6',NULL,'auth-username-password-form','master','a95c34fa-7af0-4bca-9525-86b2970b6380',0,10,_binary '\0',NULL,NULL),('a3a947e6-dfd3-4d05-b05d-f1e5b8bfe549',NULL,'direct-grant-validate-password','master','86c301b2-1c8d-4a88-abf4-9bf1e49527c5',0,20,_binary '\0',NULL,NULL),('a838266c-630e-4ab6-ab90-17f790eeaa07',NULL,'auth-cookie','master','41530172-c835-49f5-b790-0a1687865f6c',2,10,_binary '\0',NULL,NULL),('aade7397-79db-4eaf-b1c6-63cdaa6cb775',NULL,'conditional-user-configured','master','956ddc13-eca1-4fd5-a810-788369316498',0,10,_binary '\0',NULL,NULL),('aba50019-d0a8-4598-be94-24dea6e9a512',NULL,'auth-otp-form','master','956ddc13-eca1-4fd5-a810-788369316498',0,20,_binary '\0',NULL,NULL),('abcdfc40-eca1-4d8e-991e-968ae1387604',NULL,NULL,'master','ec1376c5-5eba-4144-bbe0-784bbbdd3275',1,20,_binary '','956ddc13-eca1-4fd5-a810-788369316498',NULL),('bfcf45f7-f24e-478c-b23a-616e36826c4c',NULL,'idp-confirm-link','master','d5037b22-2871-4e56-84a1-e32642e73b46',0,10,_binary '\0',NULL,NULL),('c410f097-bb90-4418-af90-0740cec3b675',NULL,'basic-auth','master','b8761b59-1a17-44cb-9f62-874e8964a56a',0,10,_binary '\0',NULL,NULL),('c4b2c217-e285-485b-b1cb-eb7cda471c65',NULL,NULL,'master','522dc68e-14d4-4a56-ad10-f73dd2219104',2,20,_binary '','ec1376c5-5eba-4144-bbe0-784bbbdd3275',NULL),('c59ec595-2519-4aa7-a1f1-17ebba53bd8b',NULL,NULL,'master','d5037b22-2871-4e56-84a1-e32642e73b46',0,20,_binary '','522dc68e-14d4-4a56-ad10-f73dd2219104',NULL),('cfb033ff-1cfe-43a1-9278-4800f439d1fe',NULL,'client-x509','master','bea2a516-a40e-4356-8d81-fd2b899b2ec5',2,40,_binary '\0',NULL,NULL),('d2f055b4-0529-48e3-885a-847758f9d884',NULL,'conditional-user-configured','master','a16640af-c710-4c79-ad69-6d26cc644f52',0,10,_binary '\0',NULL,NULL),('d872f116-0065-4cf8-98e0-f6cd7ac3d375',NULL,NULL,'master','94515019-d5bb-44f1-8cd7-97f810d12c8c',1,40,_binary '','20c33523-f4a8-4f79-94db-a70c5fed13f8',NULL),('daaa718c-6e10-4b7e-b433-494816d6d397',NULL,NULL,'master','db04d04e-462f-4ab3-81f2-0b9eb145f885',2,20,_binary '','d5037b22-2871-4e56-84a1-e32642e73b46',NULL),('eb89d072-d132-41bf-9a6e-6cbf7783e134',NULL,'auth-spnego','master','b8761b59-1a17-44cb-9f62-874e8964a56a',3,30,_binary '\0',NULL,NULL),('efed9a06-7e6f-4d70-b00b-6c801a5fc1b6',NULL,'no-cookie-redirect','master','4b09790d-4da1-4e33-bece-d7afc93462cc',0,10,_binary '\0',NULL,NULL),('f1a20308-87c4-49af-8be7-2200c19a1218',NULL,'auth-spnego','master','41530172-c835-49f5-b790-0a1687865f6c',3,20,_binary '\0',NULL,NULL),('fabd5f0e-8c5b-44c5-a55f-26ccef3c4bb7',NULL,'idp-email-verification','master','522dc68e-14d4-4a56-ad10-f73dd2219104',2,10,_binary '\0',NULL,NULL),('fd5d53c4-3051-438e-99ae-17846ede9403',NULL,'client-secret','master','bea2a516-a40e-4356-8d81-fd2b899b2ec5',2,10,_binary '\0',NULL,NULL),('fe0723cd-e034-4861-8186-4a4b8bccbe58',NULL,'client-jwt','master','bea2a516-a40e-4356-8d81-fd2b899b2ec5',2,20,_binary '\0',NULL,NULL),('ff0b447d-834d-44dc-b07d-6c1a189f8776',NULL,'registration-recaptcha-action','master','7b563019-a177-4687-997a-4c51322941ca',3,60,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('20c33523-f4a8-4f79-94db-a70c5fed13f8','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('41530172-c835-49f5-b790-0a1687865f6c','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('41e35e17-7e3f-401e-8c12-9e9378c1efcb','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('4b09790d-4da1-4e33-bece-d7afc93462cc','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('522dc68e-14d4-4a56-ad10-f73dd2219104','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('783ec450-e6e4-4484-8c20-09173d197ceb','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('7b563019-a177-4687-997a-4c51322941ca','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('86c301b2-1c8d-4a88-abf4-9bf1e49527c5','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('8e8ccb81-bb76-4f65-be7c-559eac762f03','registration','registration flow','master','basic-flow',_binary '',_binary ''),('94515019-d5bb-44f1-8cd7-97f810d12c8c','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('956ddc13-eca1-4fd5-a810-788369316498','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('a16640af-c710-4c79-ad69-6d26cc644f52','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('a95c34fa-7af0-4bca-9525-86b2970b6380','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('b8761b59-1a17-44cb-9f62-874e8964a56a','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('bea2a516-a40e-4356-8d81-fd2b899b2ec5','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('d5037b22-2871-4e56-84a1-e32642e73b46','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('db04d04e-462f-4ab3-81f2-0b9eb145f885','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('e18384e3-2f98-4c0e-883c-52eebcaee1aa','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('ec1376c5-5eba-4144-bbe0-784bbbdd3275','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('f3597280-8b00-4e5d-baa0-9b17d8ad0b3b','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0c862072-819b-49e9-81ab-d7521497fe08','create unique user config','master'),('5eb1686c-e76d-4456-b764-7e4e93b96101','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0c862072-819b-49e9-81ab-d7521497fe08','false','require.password.update.after.registration'),('5eb1686c-e76d-4456-b764-7e4e93b96101','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0ca1259a-a3c4-4501-9cb7-5991d0fa5997',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('44899084-4ced-4c41-a5fb-8347a7701427',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8131a2fb-2391-4647-a705-2a697a08e0cb',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('8261db0a-500b-4816-b3ed-76251dcd5f3d',_binary '',_binary '','counters-app',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d',_binary '',_binary '','grafana',0,_binary '\0','ie9yEgjma3bss6ns4fEr0rTeW8VcfV1L','/grafana/login/generic_oauth',_binary '\0',NULL,_binary '\0','master','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616',_binary '',_binary '','kafka-connect-counters',0,_binary '\0','xJOnK93cIk4G5HnNAp2BB5KisZOrFzxP',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','S256','pkce.code.challenge.method'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','backchannel.logout.revoke.offline.tokens'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','true','backchannel.logout.session.required'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','client_credentials.use_refresh_token'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','display.on.consent.screen'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','exclude.session.state.from.auth.response'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','id.token.as.detached.signature'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','oauth2.device.authorization.grant.enabled'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','oidc.ciba.grant.enabled'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','require.pushed.authorization.requests'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml_force_name_id_format'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.artifact.binding'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.assertion.signature'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.authnstatement'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.client.signature'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.encrypt'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.force.post.binding'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.multivalued.roles'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.onetimeuse.condition'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.server.signature'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','saml.server.signature.keyinfo.ext'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','false','tls.client.certificate.bound.access.tokens'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','true','use.refresh.tokens'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','S256','pkce.code.challenge.method'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','backchannel.logout.revoke.offline.tokens'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','true','backchannel.logout.session.required'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','client_credentials.use_refresh_token'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','display.on.consent.screen'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','exclude.session.state.from.auth.response'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','id.token.as.detached.signature'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','oauth2.device.authorization.grant.enabled'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','oidc.ciba.grant.enabled'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','require.pushed.authorization.requests'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml_force_name_id_format'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.artifact.binding'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.assertion.signature'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.authnstatement'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.client.signature'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.encrypt'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.force.post.binding'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.multivalued.roles'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.onetimeuse.condition'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.server.signature'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','saml.server.signature.keyinfo.ext'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','false','tls.client.certificate.bound.access.tokens'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','true','use.refresh.tokens'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','backchannel.logout.revoke.offline.tokens'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','true','backchannel.logout.session.required'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','client_credentials.use_refresh_token'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','display.on.consent.screen'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','exclude.session.state.from.auth.response'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','id.token.as.detached.signature'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','oauth2.device.authorization.grant.enabled'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','oidc.ciba.grant.enabled'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','require.pushed.authorization.requests'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml_force_name_id_format'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.artifact.binding'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.assertion.signature'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.authnstatement'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.client.signature'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.encrypt'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.force.post.binding'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.multivalued.roles'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.onetimeuse.condition'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.server.signature'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','saml.server.signature.keyinfo.ext'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','false','tls.client.certificate.bound.access.tokens'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('012a4a12-2734-4634-b0bb-b5439f3b3a6e','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('02fa4832-343b-42d4-a09b-450a3859ecb3','address','master','OpenID Connect built-in scope: address','openid-connect'),('3956777e-037c-4e15-b848-7f27c635357a','email','master','OpenID Connect built-in scope: email','openid-connect'),('63130e7a-6f44-4e6c-839a-a999b67c16c2','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('a522356c-f5fa-4a3c-bc80-06db19f3a647','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('ab4b3030-b38d-4bfd-85de-606da403aea5','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('b952ac96-804b-45b2-a6d1-70e21c286504','role_list','master','SAML role list','saml'),('bed143da-a760-4c0d-b20f-4ebcbd4ba408','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('d01e22a6-0b63-4be3-8aa2-1a6df5096664','profile','master','OpenID Connect built-in scope: profile','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('012a4a12-2734-4634-b0bb-b5439f3b3a6e','${rolesScopeConsentText}','consent.screen.text'),('012a4a12-2734-4634-b0bb-b5439f3b3a6e','true','display.on.consent.screen'),('012a4a12-2734-4634-b0bb-b5439f3b3a6e','false','include.in.token.scope'),('02fa4832-343b-42d4-a09b-450a3859ecb3','${addressScopeConsentText}','consent.screen.text'),('02fa4832-343b-42d4-a09b-450a3859ecb3','true','display.on.consent.screen'),('02fa4832-343b-42d4-a09b-450a3859ecb3','true','include.in.token.scope'),('3956777e-037c-4e15-b848-7f27c635357a','${emailScopeConsentText}','consent.screen.text'),('3956777e-037c-4e15-b848-7f27c635357a','true','display.on.consent.screen'),('3956777e-037c-4e15-b848-7f27c635357a','true','include.in.token.scope'),('63130e7a-6f44-4e6c-839a-a999b67c16c2','','consent.screen.text'),('63130e7a-6f44-4e6c-839a-a999b67c16c2','false','display.on.consent.screen'),('63130e7a-6f44-4e6c-839a-a999b67c16c2','false','include.in.token.scope'),('a522356c-f5fa-4a3c-bc80-06db19f3a647','${phoneScopeConsentText}','consent.screen.text'),('a522356c-f5fa-4a3c-bc80-06db19f3a647','true','display.on.consent.screen'),('a522356c-f5fa-4a3c-bc80-06db19f3a647','true','include.in.token.scope'),('ab4b3030-b38d-4bfd-85de-606da403aea5','false','display.on.consent.screen'),('ab4b3030-b38d-4bfd-85de-606da403aea5','true','include.in.token.scope'),('b952ac96-804b-45b2-a6d1-70e21c286504','${samlRoleListScopeConsentText}','consent.screen.text'),('b952ac96-804b-45b2-a6d1-70e21c286504','true','display.on.consent.screen'),('bed143da-a760-4c0d-b20f-4ebcbd4ba408','${offlineAccessScopeConsentText}','consent.screen.text'),('bed143da-a760-4c0d-b20f-4ebcbd4ba408','true','display.on.consent.screen'),('d01e22a6-0b63-4be3-8aa2-1a6df5096664','${profileScopeConsentText}','consent.screen.text'),('d01e22a6-0b63-4be3-8aa2-1a6df5096664','true','display.on.consent.screen'),('d01e22a6-0b63-4be3-8aa2-1a6df5096664','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('0ca1259a-a3c4-4501-9cb7-5991d0fa5997','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('44899084-4ced-4c41-a5fb-8347a7701427','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('44899084-4ced-4c41-a5fb-8347a7701427','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('44899084-4ced-4c41-a5fb-8347a7701427','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('44899084-4ced-4c41-a5fb-8347a7701427','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('44899084-4ced-4c41-a5fb-8347a7701427','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('44899084-4ced-4c41-a5fb-8347a7701427','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('44899084-4ced-4c41-a5fb-8347a7701427','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('44899084-4ced-4c41-a5fb-8347a7701427','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('8131a2fb-2391-4647-a705-2a697a08e0cb','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('8131a2fb-2391-4647-a705-2a697a08e0cb','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('8131a2fb-2391-4647-a705-2a697a08e0cb','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('8131a2fb-2391-4647-a705-2a697a08e0cb','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('8131a2fb-2391-4647-a705-2a697a08e0cb','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('8131a2fb-2391-4647-a705-2a697a08e0cb','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('8131a2fb-2391-4647-a705-2a697a08e0cb','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('8131a2fb-2391-4647-a705-2a697a08e0cb','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('8261db0a-500b-4816-b3ed-76251dcd5f3d','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('8261db0a-500b-4816-b3ed-76251dcd5f3d','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('8261db0a-500b-4816-b3ed-76251dcd5f3d','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('8261db0a-500b-4816-b3ed-76251dcd5f3d','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('cc795c4e-9923-4c1b-b42c-658f59bbbf2e','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary ''),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('bed143da-a760-4c0d-b20f-4ebcbd4ba408','88839928-b844-482e-840f-5204232f79c5');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('1233c78c-0f7e-4bf8-99de-e5c510fad25e','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('1cad53cf-47ed-474a-bfb9-5f81f1b076a8','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('3a63770a-b84d-4452-b792-881a65a460f9','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('402ea8b5-0df9-472e-9216-a61657f6606b','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('465257cc-b1a6-486f-8bc9-6d9de07d5bad','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('63027711-f9a3-4460-b758-597cacf2893f','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('6671652b-e5bb-4271-a155-0ad8737c945a','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('84258e2d-bbbd-4c26-8f73-081046fd86af','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('8a270cca-67fe-4dfb-8e1e-1c42c728b6ee','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9533923c-01b2-4a28-9bc3-2e4b5daeda29','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9dd1f17b-639e-44a9-b248-2bb459883800','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('ab96af7c-261a-4876-86e6-14126b6622bb','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('03a64339-0c21-4f62-95de-86855a82436b','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('04243c71-d8ce-4ef0-95b2-a834e9cd856b','465257cc-b1a6-486f-8bc9-6d9de07d5bad','max-clients','200'),('0a82e83e-7bf3-4bb2-a22b-c0e7bae4f640','8a270cca-67fe-4dfb-8e1e-1c42c728b6ee','allow-default-scopes','true'),('13081f5c-9e1d-4721-8ddc-6ae986befcba','63027711-f9a3-4460-b758-597cacf2893f','keyUse','SIG'),('18f29719-6c42-49ff-ba19-8a154086c6b4','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('19f73e87-2ee8-49d4-b6db-3661d5ba60ae','3a63770a-b84d-4452-b792-881a65a460f9','secret','0Ru7syIyKaXK0UDQ4p7nbg'),('24ee292d-4eaf-4cdc-9d52-92ba9d5924d4','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','saml-user-property-mapper'),('2644b6ea-6590-4fa6-9a45-aa5dc38473c4','3a63770a-b84d-4452-b792-881a65a460f9','priority','100'),('2d73acc8-aa7a-4b5a-ad09-72403fbd933b','9dd1f17b-639e-44a9-b248-2bb459883800','priority','100'),('2f117f1f-5b9d-4713-af80-8b867451d902','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','oidc-address-mapper'),('313a4d36-c7e1-43cc-ae75-b01cc3e6057e','63027711-f9a3-4460-b758-597cacf2893f','certificate','MIICmzCCAYMCBgGPuiCOsjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTI3MTI1NTQ2WhcNMzQwNTI3MTI1NzI2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCSTZoI/SZBpldZMUpXY1jspBmo0kyW28eNkcnWqLEz/TyqxwqiCt4YxG/ysZaxzJEvO9Q0XZVcQ7k/AUmx76vHIqiZVAdvfSAtIDWodjdL4TWCGuCE0wioV7lbHGcShMXCA4IAoHkjcUhave24JWPet21/EVLZuJbG9Pc+mSCIdCPEMbZt31E/rOjsdhgJc7wv3xvhdLx6+iLHyFqzGQ9x4btUEHqn/gCjXHz2dQnRZrhUMXSfkudKpr8uUymgW4LNd2wPiRt+sM8l89yku4uGL/lpnMWf3qv5gvQ4+iZZFjAkgOzDcTdt/20K5cBrUFGUib9bnOX2zVcIawno1M3HAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG72fn1+oZlx5RnqeBLkGkpQ3upI+Zs3wTmVbQgYg9hWyLaPhxyPISLZ4Q0q3IPzV6LQHuHCg1d2BVz1rQx8tqvF5qWNt37xDrJbriiYByaawD/d+uliulUDczHXUBaLpeBVHxjwa1k2V2B18VQhto9qbwL2QvGeDVhK1oueXE5cqJkjz+mGs9YMmQ+IbCzsZw0MS+rPPXLlG/AXIhXhikA1eDb+MFhW6dgdCFuXaLzGSRnyRN52d5GGaNGoughOqc2J0OovZD8j/TSOycnAVd5FQTDNojZtuAFIN/t3sQxvGqT6D1DeCkTreHbqPwl2ABPgXGABvHjBkSJQ1wwFWaw='),('3c33802b-469c-4cb8-aa36-6d4e326e4137','9dd1f17b-639e-44a9-b248-2bb459883800','keyUse','ENC'),('3c71fa11-fc74-473b-9643-98d87352d2e7','1cad53cf-47ed-474a-bfb9-5f81f1b076a8','algorithm','HS256'),('47f043a0-ecff-43dc-a83c-e41cc219f87d','9dd1f17b-639e-44a9-b248-2bb459883800','algorithm','RSA-OAEP'),('540e133e-515f-427c-b27a-94a1d727229f','1233c78c-0f7e-4bf8-99de-e5c510fad25e','host-sending-registration-request-must-match','true'),('551ce345-aae0-4d71-89ab-af1bd16db6fb','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('57408ec9-2752-4280-9350-f103b7a4b8d7','9dd1f17b-639e-44a9-b248-2bb459883800','certificate','MIICmzCCAYMCBgGPuiCPLjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTI3MTI1NTQ3WhcNMzQwNTI3MTI1NzI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDYP2B77jt3JKKJkPwbHtHvmpJzJBHHwb+gWGou1sdtcRImygiU20iD0Flc+K8ffj9RD+UDl1J8ygCQ7mXkie2EOgeReRETBg9YG3+BrUajf7bNM0ZyX4BYAgvF7BGkO7G0StEqV93yfdPQXQWcXaCMssDjLTApcQO95UmpbovB/FKZzqTPeoAzmCZ1EX3aHJ8/R6JJqez21RM1kQZ7BM0YgcfUyLgGwwcCaYgNrkyhLqdlu/gjVaOsWsev7RVolOJoQBus1PYtRXu0KOVKDfx0bBt0DK+GiMhv4caqR0tpUCSOW6p6v4adaZ8bV7qmemxju240oixAuQO9ioPYBH6LAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEwP2lHyLy9mxFJ8JhYHkYgITy3rbMYfVgLNrrWyDaLkX2IL0pTFFL4glSszYlKVnn4edDtCLSGRwV+k7nzkhtNSrpNELmMSZ357mpawd8U56+bkB5EN26EGaf2YbSG6UtgM7qfouk68+RluZOnZBtQoeaQyRleZoWUOJ9K2GPLe9ct1AFNkY0I2FnQI1P8bTtbwUgxuy9NG5KGMrxxGjIBI5D5Psxvtxvcq0wMPZlRMGSXtRyE8M0W+QJ5anDXWcs1BZfgNZ1RnAK61FdtpUv3FSGEtozwgQ+VmOd0LL5uqkMW2F1ruspZlxkymQxjPm/co3cXvzCUSjvw6fxJx9tI='),('5fa8db5a-b125-4bca-b816-182e98f775fe','63027711-f9a3-4460-b758-597cacf2893f','privateKey','MIIEowIBAAKCAQEAkk2aCP0mQaZXWTFKV2NY7KQZqNJMltvHjZHJ1qixM/08qscKogreGMRv8rGWscyRLzvUNF2VXEO5PwFJse+rxyKomVQHb30gLSA1qHY3S+E1ghrghNMIqFe5WxxnEoTFwgOCAKB5I3FIWr3tuCVj3rdtfxFS2biWxvT3PpkgiHQjxDG2bd9RP6zo7HYYCXO8L98b4XS8evoix8hasxkPceG7VBB6p/4Ao1x89nUJ0Wa4VDF0n5LnSqa/LlMpoFuCzXdsD4kbfrDPJfPcpLuLhi/5aZzFn96r+YL0OPomWRYwJIDsw3E3bf9tCuXAa1BRlIm/W5zl9s1XCGsJ6NTNxwIDAQABAoIBAAMhOdxbXgglgNTdoxN/gpV9ZTchWJYZmYlDxyeacEAGeNfGbknNJbct7J8qgWjIUYrLIt0D64APytS4OFVgJTKbYTP2gjo2WQveFofGD6TF6pkf7hGpWhQP3F1AnEvfH0PpQ0y0IiNJ9xxJ194KnrpS/jqrqjQSKNeUwf1K1VFV8kmUb1gjMuXRNaRGbQEHp3OMlXBOyOHsL8VrUS2RKn9/5y+d+sp1lnQU4Y06dtr7EVRM99YjE5lad5yLmNd9nR+u4XWBcl9RtZMY13vsSwb3/UdwB8YT5+wXBuycYi3pz74MI/BjnRRslt6hYK9JbvBNIFIWGOGji1BnRtUBCzECgYEA6P0l4w4RmC8ObS1H8BfC8EBbTWkvUBPN3CR+01spmksRmTAoRzcK+DWX+mt+b9XpGv2Qeh3zhoMt/LXMW3G78XXhOqLlntCjxMdxGqWoREDKPkqtCgt6NrnzqWL6EpTqKLzhEdgjMgX3OXlhPyhVed9pFPUfFOjdZBM1OE4sCjMCgYEAoMC0vbktNt7u7K929gMZhN5YKxDhgi937TzVp1GqDyQu9U8m8IfjKbjA7Ms7+Qim0yMVFbGpSVQPCvWRJIi+Ibi6I3n8QEiDMx+fIv97L02cdu846k33/u0303vsk+UKfnu7P0Acc7AJD46NB4f6zSpXsjaTL7ABTeZ+obZvwh0CgYEA20JYpEv6HNiz3+TMHVOPPZ+jDL+fKeHpSnIB9I+HIE/jGOGsFhDjvuBYzO7aRw7s11ym2XVUV1MeNQM1dR0cfMitlAv2wbWhWS9D7orVRp4ede6614gjlFr8xnyB0HjZwEq4GJ3pyUq59RmYfeJMRmwMLQ/dF0VqC6LT49AVO+cCgYADP2FnY9JSBXb2OSVCGxXs5UEKvbCQnLzjghMe6jtxSt3X/t1ehqBEO4NKRWDUyyPzqAXJBmnRHW2gXw2rm0ecDstT5CcAdXaRFdZ1MowejIbYsESKF0EnWUuDbkF9S2dG3uENihIJFElakxquSET82Bolc4zNrdSY6kssoS7o0QKBgAWK3Y/SKdtUG8CkCMVE09GoSpGKSIkNhp+7Eiq8O5qIvyKAF8IH2db5Qv0g5ypIQfpIXeLta7zBlllTzCzwATg4mYV5XwW8I1PQ2TvxeWM0otovKahR/gsBOncQnUp4H75U4iJcPcUE8C++jWIbMO06J8jYTKL0NFli+zvkMvqy'),('68f40e0b-8070-46d5-a65f-4b517601163a','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('71bc950b-0970-4dba-936a-ac1b278c6de8','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('746a902e-7ed1-46e4-94b6-338f91390176','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7595ffd8-89c8-4647-abcd-7913c48813c0','1cad53cf-47ed-474a-bfb9-5f81f1b076a8','priority','100'),('7cee47e2-9f06-4999-9a20-7ffb781a95ae','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('91bbd64f-cf6e-4b2a-9a5d-70c487f62340','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9aebc987-ca5a-4630-8251-c5719623c6dd','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','saml-role-list-mapper'),('9f53e488-41e4-4191-830c-ed34c3600c18','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','saml-role-list-mapper'),('a84ecbed-333c-4771-8f16-60c34e8dcdd5','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ada3d214-733f-496b-ae8a-882709410c3d','63027711-f9a3-4460-b758-597cacf2893f','priority','100'),('c311a8f7-a1d6-4141-b19e-a4fe79926bc7','9dd1f17b-639e-44a9-b248-2bb459883800','privateKey','MIIEpAIBAAKCAQEA2D9ge+47dySiiZD8Gx7R75qScyQRx8G/oFhqLtbHbXESJsoIlNtIg9BZXPivH34/UQ/lA5dSfMoAkO5l5InthDoHkXkREwYPWBt/ga1Go3+2zTNGcl+AWAILxewRpDuxtErRKlfd8n3T0F0FnF2gjLLA4y0wKXEDveVJqW6LwfxSmc6kz3qAM5gmdRF92hyfP0eiSans9tUTNZEGewTNGIHH1Mi4BsMHAmmIDa5MoS6nZbv4I1WjrFrHr+0VaJTiaEAbrNT2LUV7tCjlSg38dGwbdAyvhojIb+HGqkdLaVAkjluqer+GnWmfG1e6pnpsY7tuNKIsQLkDvYqD2AR+iwIDAQABAoIBAQCpGj5oC28DB2n3K6KJzrsapIRbd9xTmkYwrJM0V46SHba1EI5PYX8+XMJU+r9vYDlBOa279ixyG0EAFP0nD1jmar6aWtMoTjfXjYFTNd4kYu3fX3Z6YAYsTEVKnAVbqbaYJ12TwCx2wUDPEr8dfPXcsLg3rpGYBqGHcPL+hMzTfv5DaROLyzJpBB0lUHwBL6Riz/I/MZpwtsrwFk+yqNSu9TCgJlbnO2izOwjrsXYMgv9j5ud1XJwpqL/B4VgQzSzVl+fs6bLlpyW9oyDai4uCqwqrFnzVLO69DHKsDZFGQjG9gmcns0bE9cTAyjv60nhttP0sdn1rN9F2GrHVLlr5AoGBAPBUxMOSaiiGCvhEQKU3U1rTlYV0LAUCAhHxAECvNNcRUv5KdPH5lohDjWGfeUV5KL9i4syXiCWPBYM/lCB5e75Bw1UD+yOxgxCkNHiip8cF1TqODjrxVkvC6m1pvJxCjaAadvIloD5d/q7a8zcoawa95MuXyHdXmvACH1HBUzmlAoGBAOZYpKRWZBD8CeuVERQCvbr+tBIJ4J+ZWHqcv/fywy565xP2YQaTrGxKPi44Kr01DiyC1ZjCn/k8Q4/saIMct+VmzBKRXX9ELWs5Jqitl2GiNQujCYpJ6RKcvF3R+zmPT/tlNja3TlrVcQOcNv5MszvoKGmcKGMQvk4qpDn07IBvAoGAAKj68V6RlBLqLMxjMRD51aIHIxqylEDxKIN08LiKeJy/kZs6vv9kfnNRDBeYCazPg9cNsGoqIZBG/5lJGt26jUc49h7QrcRrC7ynuD0aIN3PPB3vxBGtnv+mDS7hKby1Dt+DvB6GViWD8Y8AZAJkaNxUqIp+LnW7IzWeSGczh1ECgYEA4YGmrbxl+rrEe35UWeLVHFx+rao93gGiPWd4CKYBr19jGof6NRYdl2aXuWgDb3ihh7IOqp7fPoFhI2Wua62R22PoJcVqY027qV0qG7jWmx7SD7JthJUXOMF5J+CKsq86/kL38FlEvGh5W69zp0IvtlZyOfJHF7Usmhnk7Vh6sMECgYAGfjnSb21tLTxmNdy1bLFDnkqAzxeVxT0pBFofDBETyEtsXjv1MoEB5YSHBm2vf17JvLkwgAIMoKkUQ3gWt+bhoosFtY6K0Ke9N0m5PRf5zL5595MmW2tKjL6ar2DzlgoOvuWMznOhihblpCrvoxOg7CJY/LLgrPNql4vVIq883A=='),('c68d2659-87cf-4211-a254-e94f669b447c','1cad53cf-47ed-474a-bfb9-5f81f1b076a8','kid','4a1b4c2a-443b-477e-b797-b31b3827248a'),('c7f1673d-15ec-49ae-b9c7-c4762b70b2c2','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','saml-user-property-mapper'),('c8498223-67a5-4386-b07a-fae8d5677a8d','1cad53cf-47ed-474a-bfb9-5f81f1b076a8','secret','no43UKxVa2IVQoV0syMpvIn-Ljxa8nmsxp_GyVp-DOBiv1P47Odj9fckU5DAuRwRRDsBnjLeLIXXRSfMpKR9JA'),('ca43f5a8-d0c0-4651-b882-a6a392ed5cf2','3a63770a-b84d-4452-b792-881a65a460f9','kid','8a7e9da4-88e8-4e8f-a4f3-4fef5beb8d65'),('d4067ecd-747d-49bb-be49-5950e0a88260','6671652b-e5bb-4271-a155-0ad8737c945a','allowed-protocol-mapper-types','oidc-address-mapper'),('de20ca2f-3c83-4c55-ac24-20d12c8debda','402ea8b5-0df9-472e-9216-a61657f6606b','allow-default-scopes','true'),('f67858cb-bbca-4862-b394-5c4d041348f3','ab96af7c-261a-4876-86e6-14126b6622bb','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f97628cc-cbc3-4b56-998f-5fa02e079862','1233c78c-0f7e-4bf8-99de-e5c510fad25e','client-uris-must-match','true');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1bc60b5b-4f64-443f-8e55-64c0e875936d','38009020-dd0d-41b3-b384-0a390f265921'),('1bc60b5b-4f64-443f-8e55-64c0e875936d','543c0bfb-7cd3-4dac-b689-82062dfffc06'),('1bc60b5b-4f64-443f-8e55-64c0e875936d','88839928-b844-482e-840f-5204232f79c5'),('1bc60b5b-4f64-443f-8e55-64c0e875936d','92644d06-c7be-4485-9ced-6c739c996828'),('38009020-dd0d-41b3-b384-0a390f265921','8ff0c3ef-ad4a-4eec-9168-90d2991a1cee'),('41e9af8b-95bb-495a-a5ba-253987d70b2b','a825aa75-39cb-4cdb-8616-92bd90a03232'),('587ca412-7aa9-41fb-afbb-978da17a082c','142efca0-e388-4458-b110-5935b2239088'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','0a60ab79-ec43-476f-9cac-e48ab83e7b18'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','0f55cffe-b24a-4eba-9dd8-f41ede3d0f55'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','142efca0-e388-4458-b110-5935b2239088'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','1685612b-74c4-4c73-a2d8-67eabc48a33c'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','1987c839-0f27-4eae-8ba9-022cf048d5f8'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','2b939c2e-69a1-49d6-92bd-03e2d6c8bb60'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','3f4c4428-aecd-43a5-9988-67172cda8d5a'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','4619e992-9ff3-4dea-8b38-decbd7aee565'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','495727c4-fe5a-4b66-b654-3f7052f66851'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','587ca412-7aa9-41fb-afbb-978da17a082c'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','5b6dd49b-5683-46e4-8222-0bba66865035'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','5d5788e2-d422-4c68-80c7-c46bb6f278f9'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','6f2758c5-6642-4ac1-93b0-db0542500c38'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','744dfb25-6777-4cf7-bc98-1afec12b45f7'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','79cb0932-1cfc-4dba-83be-464f36dfc5cc'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','8a632dc9-06a0-4b04-912f-b7acf337b7dc'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','c4d7d65e-2600-46d4-b125-fd697262a039'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','ccd6b28e-bae6-4984-b772-08b9cd87d85f'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','e0cb7311-11e5-424c-90a3-fe8fbb35393e'),('c4d7d65e-2600-46d4-b125-fd697262a039','1685612b-74c4-4c73-a2d8-67eabc48a33c'),('c4d7d65e-2600-46d4-b125-fd697262a039','5b6dd49b-5683-46e4-8222-0bba66865035');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('73c175f1-b872-44a6-8802-7edc657bfe4a',NULL,'password','7623ce3d-423c-4470-9193-0b3f426a2e57',1716814647519,NULL,'{\"value\":\"oNQjWofgnM7zgrduxHa9E6+RkVRZzZV3mevE0VPEsoSvoZCC8y/2RUWAFjmFigA5GZ4ff7XTOLZu58b52DVb1g==\",\"salt\":\"oH6rLN13zkr5J3Xtt1xI8w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-05-27 12:57:03',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-05-27 12:57:03',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-05-27 12:57:03',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-05-27 12:57:03',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-05-27 12:57:04',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-05-27 12:57:04',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-05-27 12:57:06',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-05-27 12:57:06',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-05-27 12:57:06',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-05-27 12:57:07',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-05-27 12:57:07',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-05-27 12:57:07',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-05-27 12:57:08',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-05-27 12:57:08',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-05-27 12:57:08',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-05-27 12:57:08',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-05-27 12:57:08',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-05-27 12:57:09',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-05-27 12:57:09',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-05-27 12:57:09',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-05-27 12:57:09',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-05-27 12:57:09',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-05-27 12:57:10',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-05-27 12:57:10',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-05-27 12:57:10',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-05-27 12:57:10',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-05-27 12:57:11',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-05-27 12:57:11',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-05-27 12:57:12',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-05-27 12:57:12',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-05-27 12:57:12',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-05-27 12:57:12',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-05-27 12:57:12',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-05-27 12:57:12',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-05-27 12:57:13',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-05-27 12:57:14',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-05-27 12:57:14',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6814620109'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-05-27 12:57:14',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-05-27 12:57:14',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-05-27 12:57:14',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-05-27 12:57:14',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-05-27 12:57:14',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-05-27 12:57:15',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-05-27 12:57:15',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-05-27 12:57:15',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-05-27 12:57:15',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-05-27 12:57:15',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-05-27 12:57:16',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-05-27 12:57:16',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-05-27 12:57:17',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-05-27 12:57:17',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-05-27 12:57:17',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-05-27 12:57:17',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-05-27 12:57:17',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-05-27 12:57:17',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-05-27 12:57:17',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-05-27 12:57:17',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-05-27 12:57:19',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-05-27 12:57:20',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-05-27 12:57:20',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-05-27 12:57:20',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-05-27 12:57:20',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-05-27 12:57:20',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-05-27 12:57:20',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-05-27 12:57:20',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-05-27 12:57:20',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-05-27 12:57:20',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-05-27 12:57:20',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-05-27 12:57:20',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-05-27 12:57:20',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6814620109'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-05-27 12:57:20',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'6814620109'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-05-27 12:57:20',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-05-27 12:57:20',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-05-27 12:57:20',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-05-27 12:57:21',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-05-27 12:57:21',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-05-27 12:57:21',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-05-27 12:57:21',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-05-27 12:57:22',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-05-27 12:57:22',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-05-27 12:57:22',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-05-27 12:57:22',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-05-27 12:57:22',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-05-27 12:57:22',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6814620109'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-05-27 12:57:22',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6814620109'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-05-27 12:57:22',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'6814620109'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-05-27 12:57:22',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-05-27 12:57:22',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'6814620109'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'6814620109'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6814620109'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'6814620109'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'6814620109'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-05-27 12:57:22',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'6814620109'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6814620109'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6814620109'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:22',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'6814620109'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-05-27 12:57:23',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'6814620109'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-05-27 12:57:23',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'6814620109');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','012a4a12-2734-4634-b0bb-b5439f3b3a6e',_binary ''),('master','02fa4832-343b-42d4-a09b-450a3859ecb3',_binary '\0'),('master','3956777e-037c-4e15-b848-7f27c635357a',_binary ''),('master','63130e7a-6f44-4e6c-839a-a999b67c16c2',_binary ''),('master','a522356c-f5fa-4a3c-bc80-06db19f3a647',_binary '\0'),('master','ab4b3030-b38d-4bfd-85de-606da403aea5',_binary '\0'),('master','b952ac96-804b-45b2-a6d1-70e21c286504',_binary ''),('master','bed143da-a760-4c0d-b20f-4ebcbd4ba408',_binary '\0'),('master','d01e22a6-0b63-4be3-8aa2-1a6df5096664',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0a60ab79-ec43-476f-9cac-e48ab83e7b18','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-events}','view-events','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('0f55cffe-b24a-4eba-9dd8-f41ede3d0f55','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-clients}','manage-clients','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('142efca0-e388-4458-b110-5935b2239088','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_query-clients}','query-clients','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('1685612b-74c4-4c73-a2d8-67eabc48a33c','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_query-groups}','query-groups','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('1987c839-0f27-4eae-8ba9-022cf048d5f8','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('1bc60b5b-4f64-443f-8e55-64c0e875936d','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('22b11b1a-94cd-4d4e-884d-7368d26d5f63','8261db0a-500b-4816-b3ed-76251dcd5f3d',_binary '',NULL,'AddCounter','master','8261db0a-500b-4816-b3ed-76251dcd5f3d',NULL),('2b939c2e-69a1-49d6-92bd-03e2d6c8bb60','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('305d3b04-33c5-457e-92b7-65f87f230d5e','8261db0a-500b-4816-b3ed-76251dcd5f3d',_binary '',NULL,'Viewer','master','8261db0a-500b-4816-b3ed-76251dcd5f3d',NULL),('38009020-dd0d-41b3-b384-0a390f265921','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_manage-account}','manage-account','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('3f4c4428-aecd-43a5-9988-67172cda8d5a','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-realm}','manage-realm','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('41e9af8b-95bb-495a-a5ba-253987d70b2b','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_manage-consent}','manage-consent','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('4619e992-9ff3-4dea-8b38-decbd7aee565','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-events}','manage-events','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('495727c4-fe5a-4b66-b654-3f7052f66851','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-authorization}','view-authorization','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('543c0bfb-7cd3-4dac-b689-82062dfffc06','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('587ca412-7aa9-41fb-afbb-978da17a082c','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-clients}','view-clients','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('5b6dd49b-5683-46e4-8222-0bba66865035','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_query-users}','query-users','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('5d5788e2-d422-4c68-80c7-c46bb6f278f9','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-users}','manage-users','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('6f2758c5-6642-4ac1-93b0-db0542500c38','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_create-client}','create-client','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('707b5e78-71b8-47e8-9ba8-a389ed971dbd','b9a36b95-537a-45f6-a5b6-6b3423f4188d',_binary '',NULL,'editor','master','b9a36b95-537a-45f6-a5b6-6b3423f4188d',NULL),('744dfb25-6777-4cf7-bc98-1afec12b45f7','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-realm}','view-realm','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('79cb0932-1cfc-4dba-83be-464f36dfc5cc','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_query-realms}','query-realms','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('88839928-b844-482e-840f-5204232f79c5','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('8a632dc9-06a0-4b04-912f-b7acf337b7dc','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_manage-authorization}','manage-authorization','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('8ff0c3ef-ad4a-4eec-9168-90d2991a1cee','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_manage-account-links}','manage-account-links','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('92644d06-c7be-4485-9ced-6c739c996828','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_view-profile}','view-profile','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('973ff758-e2dd-4a42-aac4-c44ddc192410','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_delete-account}','delete-account','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('a825aa75-39cb-4cdb-8616-92bd90a03232','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_view-consent}','view-consent','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('c4d7d65e-2600-46d4-b125-fd697262a039','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-users}','view-users','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('c9b73c44-5706-4fd2-9961-b4a1df27bf08','44899084-4ced-4c41-a5fb-8347a7701427',_binary '','${role_view-applications}','view-applications','master','44899084-4ced-4c41-a5fb-8347a7701427',NULL),('ccd6b28e-bae6-4984-b772-08b9cd87d85f','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_view-identity-providers}','view-identity-providers','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('d8183f5e-1e03-43d3-b097-1968dfd34c0d','b9a36b95-537a-45f6-a5b6-6b3423f4188d',_binary '',NULL,'viewer','master','b9a36b95-537a-45f6-a5b6-6b3423f4188d',NULL),('dc8cfab8-d433-404e-86af-fdf0c7e3ae6b','0ca1259a-a3c4-4501-9cb7-5991d0fa5997',_binary '','${role_read-token}','read-token','master','0ca1259a-a3c4-4501-9cb7-5991d0fa5997',NULL),('e0cb7311-11e5-424c-90a3-fe8fbb35393e','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',_binary '','${role_impersonation}','impersonation','master','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',NULL),('f91c3e25-d183-43fb-9e24-9ac6d8d0aafa','b9a36b95-537a-45f6-a5b6-6b3423f4188d',_binary '',NULL,'admin','master','b9a36b95-537a-45f6-a5b6-6b3423f4188d',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('652e4','16.1.0',1716814645);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'012a4a12-2734-4634-b0bb-b5439f3b3a6e'),('219605b5-f20a-4205-b09a-46ace15f3fee','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a522356c-f5fa-4a3c-bc80-06db19f3a647'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a522356c-f5fa-4a3c-bc80-06db19f3a647'),('3a7bc17d-3e82-4800-a18d-7fbee8cb54f7','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'63130e7a-6f44-4e6c-839a-a999b67c16c2'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('4eb9b312-1cef-446f-a4df-c6fb25e5b4a3','role list','saml','saml-role-list-mapper',NULL,'b952ac96-804b-45b2-a6d1-70e21c286504'),('57b5f81a-324f-41af-b8d8-902ec7783dff','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'3956777e-037c-4e15-b848-7f27c635357a'),('6f588c4e-b497-4367-98ff-bced4ae28b22','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','address','openid-connect','oidc-address-mapper',NULL,'02fa4832-343b-42d4-a09b-450a3859ecb3'),('75238c34-70b4-4791-9482-3fea97708ebb','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','fe0732e4-31ed-4c68-9f32-ae7e37fa6616',NULL),('77956271-4f35-4e3f-9de0-b2d05e22215a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('810d66d7-0306-47d9-abca-330a010f7951','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('8374c7c1-46a7-4a49-ac87-af163ca4830f','full name','openid-connect','oidc-full-name-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('848aa67c-6d70-439d-89a6-fb02fd114394','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','locale','openid-connect','oidc-usermodel-attribute-mapper','7f2b7d68-dbb8-4078-ae8d-c2c69af8c081',NULL),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','fe0732e4-31ed-4c68-9f32-ae7e37fa6616',NULL),('a55e8546-e5df-4ba4-a4a4-c9a9e9680181','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'012a4a12-2734-4634-b0bb-b5439f3b3a6e'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','fe0732e4-31ed-4c68-9f32-ae7e37fa6616',NULL),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','username','openid-connect','oidc-usermodel-property-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'012a4a12-2734-4634-b0bb-b5439f3b3a6e'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ab4b3030-b38d-4bfd-85de-606da403aea5'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','email','openid-connect','oidc-usermodel-property-mapper',NULL,'3956777e-037c-4e15-b848-7f27c635357a'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab4b3030-b38d-4bfd-85de-606da403aea5'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01e22a6-0b63-4be3-8aa2-1a6df5096664'),('fb197777-2269-4bb8-88f5-09cab4532d5a','audience resolve','openid-connect','oidc-audience-resolve-mapper','9b51e4e4-b9db-46a3-8c2d-13dff9efdee8',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','true','access.token.claim'),('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','middle_name','claim.name'),('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','true','id.token.claim'),('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','String','jsonType.label'),('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','middleName','user.attribute'),('12133f35-c69e-4eec-ac74-5ed9f38d4ba2','true','userinfo.token.claim'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','true','access.token.claim'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','profile','claim.name'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','true','id.token.claim'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','String','jsonType.label'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','profile','user.attribute'),('16e71b09-bb97-421c-88b4-7a1f684ea7b4','true','userinfo.token.claim'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','true','access.token.claim'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','realm_access.roles','claim.name'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','String','jsonType.label'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','true','multivalued'),('1d432e69-8c61-4bfc-bdc3-b0d573c8dce9','foo','user.attribute'),('219605b5-f20a-4205-b09a-46ace15f3fee','true','access.token.claim'),('219605b5-f20a-4205-b09a-46ace15f3fee','phone_number_verified','claim.name'),('219605b5-f20a-4205-b09a-46ace15f3fee','true','id.token.claim'),('219605b5-f20a-4205-b09a-46ace15f3fee','boolean','jsonType.label'),('219605b5-f20a-4205-b09a-46ace15f3fee','phoneNumberVerified','user.attribute'),('219605b5-f20a-4205-b09a-46ace15f3fee','true','userinfo.token.claim'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','true','access.token.claim'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','phone_number','claim.name'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','true','id.token.claim'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','String','jsonType.label'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','phoneNumber','user.attribute'),('2a914454-3a5e-460f-b7b8-1fb205418dd9','true','userinfo.token.claim'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','true','access.token.claim'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','given_name','claim.name'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','true','id.token.claim'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','String','jsonType.label'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','firstName','user.attribute'),('47f8b509-f23c-4727-bbf3-f3dae7cbadce','true','userinfo.token.claim'),('4eb9b312-1cef-446f-a4df-c6fb25e5b4a3','Role','attribute.name'),('4eb9b312-1cef-446f-a4df-c6fb25e5b4a3','Basic','attribute.nameformat'),('4eb9b312-1cef-446f-a4df-c6fb25e5b4a3','false','single'),('57b5f81a-324f-41af-b8d8-902ec7783dff','true','access.token.claim'),('57b5f81a-324f-41af-b8d8-902ec7783dff','family_name','claim.name'),('57b5f81a-324f-41af-b8d8-902ec7783dff','true','id.token.claim'),('57b5f81a-324f-41af-b8d8-902ec7783dff','String','jsonType.label'),('57b5f81a-324f-41af-b8d8-902ec7783dff','lastName','user.attribute'),('57b5f81a-324f-41af-b8d8-902ec7783dff','true','userinfo.token.claim'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','true','access.token.claim'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','email_verified','claim.name'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','true','id.token.claim'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','boolean','jsonType.label'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','emailVerified','user.attribute'),('647ddcb6-51dc-43a4-8995-1fc578c58bc4','true','userinfo.token.claim'),('6f588c4e-b497-4367-98ff-bced4ae28b22','true','access.token.claim'),('6f588c4e-b497-4367-98ff-bced4ae28b22','birthdate','claim.name'),('6f588c4e-b497-4367-98ff-bced4ae28b22','true','id.token.claim'),('6f588c4e-b497-4367-98ff-bced4ae28b22','String','jsonType.label'),('6f588c4e-b497-4367-98ff-bced4ae28b22','birthdate','user.attribute'),('6f588c4e-b497-4367-98ff-bced4ae28b22','true','userinfo.token.claim'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','true','access.token.claim'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','true','id.token.claim'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','country','user.attribute.country'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','formatted','user.attribute.formatted'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','locality','user.attribute.locality'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','postal_code','user.attribute.postal_code'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','region','user.attribute.region'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','street','user.attribute.street'),('72113406-f75b-4cd5-a39e-85d50e35a7ad','true','userinfo.token.claim'),('75238c34-70b4-4791-9482-3fea97708ebb','true','access.token.claim'),('75238c34-70b4-4791-9482-3fea97708ebb','clientId','claim.name'),('75238c34-70b4-4791-9482-3fea97708ebb','true','id.token.claim'),('75238c34-70b4-4791-9482-3fea97708ebb','String','jsonType.label'),('75238c34-70b4-4791-9482-3fea97708ebb','clientId','user.session.note'),('77956271-4f35-4e3f-9de0-b2d05e22215a','true','access.token.claim'),('77956271-4f35-4e3f-9de0-b2d05e22215a','updated_at','claim.name'),('77956271-4f35-4e3f-9de0-b2d05e22215a','true','id.token.claim'),('77956271-4f35-4e3f-9de0-b2d05e22215a','String','jsonType.label'),('77956271-4f35-4e3f-9de0-b2d05e22215a','updatedAt','user.attribute'),('77956271-4f35-4e3f-9de0-b2d05e22215a','true','userinfo.token.claim'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','true','access.token.claim'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','website','claim.name'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','true','id.token.claim'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','String','jsonType.label'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','website','user.attribute'),('7bc83c39-cf6c-4f5c-b88d-98dbdf46927e','true','userinfo.token.claim'),('810d66d7-0306-47d9-abca-330a010f7951','true','access.token.claim'),('810d66d7-0306-47d9-abca-330a010f7951','zoneinfo','claim.name'),('810d66d7-0306-47d9-abca-330a010f7951','true','id.token.claim'),('810d66d7-0306-47d9-abca-330a010f7951','String','jsonType.label'),('810d66d7-0306-47d9-abca-330a010f7951','zoneinfo','user.attribute'),('810d66d7-0306-47d9-abca-330a010f7951','true','userinfo.token.claim'),('8374c7c1-46a7-4a49-ac87-af163ca4830f','true','access.token.claim'),('8374c7c1-46a7-4a49-ac87-af163ca4830f','true','id.token.claim'),('8374c7c1-46a7-4a49-ac87-af163ca4830f','true','userinfo.token.claim'),('848aa67c-6d70-439d-89a6-fb02fd114394','true','access.token.claim'),('848aa67c-6d70-439d-89a6-fb02fd114394','gender','claim.name'),('848aa67c-6d70-439d-89a6-fb02fd114394','true','id.token.claim'),('848aa67c-6d70-439d-89a6-fb02fd114394','String','jsonType.label'),('848aa67c-6d70-439d-89a6-fb02fd114394','gender','user.attribute'),('848aa67c-6d70-439d-89a6-fb02fd114394','true','userinfo.token.claim'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','true','access.token.claim'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','locale','claim.name'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','true','id.token.claim'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','String','jsonType.label'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','locale','user.attribute'),('85cd1c38-de6c-4b6d-bf46-b2a798e8cb24','true','userinfo.token.claim'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','true','access.token.claim'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','locale','claim.name'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','true','id.token.claim'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','String','jsonType.label'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','locale','user.attribute'),('86deb19f-a07c-4205-b0bf-6247e8f5f5e1','true','userinfo.token.claim'),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','true','access.token.claim'),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','clientAddress','claim.name'),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','true','id.token.claim'),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','String','jsonType.label'),('9dc24dc4-45f3-4df1-b23e-b5ff37b40ada','clientAddress','user.session.note'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','true','access.token.claim'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','clientHost','claim.name'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','true','id.token.claim'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','String','jsonType.label'),('a885b0f3-96b4-4084-b19d-9a19308b4a30','clientHost','user.session.note'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','true','access.token.claim'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','preferred_username','claim.name'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','true','id.token.claim'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','String','jsonType.label'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','username','user.attribute'),('aa052be1-5823-4b0d-a9f0-8950bb5e536b','true','userinfo.token.claim'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','true','access.token.claim'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','resource_access.${client_id}.roles','claim.name'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','String','jsonType.label'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','true','multivalued'),('ab95dc15-012d-42d9-8e28-a8d557b96dae','foo','user.attribute'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','true','access.token.claim'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','upn','claim.name'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','true','id.token.claim'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','String','jsonType.label'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','username','user.attribute'),('b235a37c-b0df-40a1-9e2e-3f29c548ee69','true','userinfo.token.claim'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','true','access.token.claim'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','nickname','claim.name'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','true','id.token.claim'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','String','jsonType.label'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','nickname','user.attribute'),('d3b4c6e0-4640-4962-8f76-ca7d0f73c685','true','userinfo.token.claim'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','true','access.token.claim'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','email','claim.name'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','true','id.token.claim'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','String','jsonType.label'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','email','user.attribute'),('d75e4660-f8dd-4815-b20a-065c0a9a7695','true','userinfo.token.claim'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','true','access.token.claim'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','groups','claim.name'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','true','id.token.claim'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','String','jsonType.label'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','true','multivalued'),('d9551372-7c11-4a96-ad22-ae67f4de2d50','foo','user.attribute'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','true','access.token.claim'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','picture','claim.name'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','true','id.token.claim'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','String','jsonType.label'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','picture','user.attribute'),('ef1ba7db-a414-4eba-b984-14b34b1b64dd','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','cc795c4e-9923-4c1b-b42c-658f59bbbf2e',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','41530172-c835-49f5-b790-0a1687865f6c','8e8ccb81-bb76-4f65-be7c-559eac762f03','86c301b2-1c8d-4a88-abf4-9bf1e49527c5','94515019-d5bb-44f1-8cd7-97f810d12c8c','bea2a516-a40e-4356-8d81-fd2b899b2ec5',2592000,_binary '\0',900,_binary '',_binary '\0','e18384e3-2f98-4c0e-883c-52eebcaee1aa',0,_binary '\0',0,0,'1bc60b5b-4f64-443f-8e55-64c0e875936d');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('bruteForceProtected','master','false'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','master','60'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','master','60');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('44899084-4ced-4c41-a5fb-8347a7701427','/realms/master/account/*'),('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','/admin/master/console/*'),('8261db0a-500b-4816-b3ed-76251dcd5f3d','*'),('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','/realms/master/account/*'),('b9a36b95-537a-45f6-a5b6-6b3423f4188d','https://app.stage.local/grafana/login/generic_oauth'),('fe0732e4-31ed-4c68-9f32-ae7e37fa6616','*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0d44900c-53b9-4e54-9735-91c091ff6b0a','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('39d26939-938d-4bff-8b4a-f2109b80d700','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('5424960b-d1a4-49f9-9ad0-5264f085ec63','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('75a1b721-a267-4374-a105-433070ff9502','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a0140f30-3444-41e1-805d-88c1e5fb5c92','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('e388a765-6307-4ebb-bfa5-acbd9f2d4a0f','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('f9f0e974-5d7a-4f4a-a11f-f0c3fdf28677','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('9b51e4e4-b9db-46a3-8c2d-13dff9efdee8','38009020-dd0d-41b3-b384-0a390f265921');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('7623ce3d-423c-4470-9193-0b3f426a2e57',NULL,'4a705894-8ad1-4019-8358-1e57183f38d1',_binary '\0',_binary '',NULL,NULL,NULL,'master','lan',1716814647487,NULL,0),('c089df24-d7c7-42e6-819e-159135864519',NULL,'5b6a7138-3316-4c47-bfbb-2bfdd3c1ff9b',_binary '\0',_binary '',NULL,NULL,NULL,'master','service-account-kafka-connect-counters',1716815923133,'fe0732e4-31ed-4c68-9f32-ae7e37fa6616',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1bc60b5b-4f64-443f-8e55-64c0e875936d','7623ce3d-423c-4470-9193-0b3f426a2e57'),('5f860213-b02d-4d8b-aed6-a1bfd63aeb97','7623ce3d-423c-4470-9193-0b3f426a2e57'),('1bc60b5b-4f64-443f-8e55-64c0e875936d','c089df24-d7c7-42e6-819e-159135864519'),('22b11b1a-94cd-4d4e-884d-7368d26d5f63','c089df24-d7c7-42e6-819e-159135864519');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('7f2b7d68-dbb8-4078-ae8d-c2c69af8c081','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'keycloak'
--

--
-- Dumping routines for database 'keycloak'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 11:16:08
