CREATE DATABASE  IF NOT EXISTS `keycloak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `keycloak`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.57.90    Database: keycloak
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00331023-86e5-48c6-beee-461566e9faa0',NULL,'identity-provider-redirector','master','e9d7ec40-561f-491b-ad2b-deb801447d72',2,25,_binary '\0',NULL,NULL),('00867fed-feaa-4a1c-931b-6eb9cce8164e',NULL,NULL,'master','9f2653c8-7e1c-4c8a-9f87-a8315a732cd0',0,20,_binary '','ebdc62f0-bbf4-464c-beb0-dbf0cd72f580',NULL),('03cb071a-4522-4fd6-bb8c-772dd3f7602f',NULL,NULL,'master','64669c18-d6a5-4dac-b5e3-05722d2b877a',1,40,_binary '','eb8cc3a4-248b-4774-8151-23c1c143556c',NULL),('089e1daf-f84e-4326-b75b-7180433e73c9',NULL,'auth-spnego','master','e9d7ec40-561f-491b-ad2b-deb801447d72',3,20,_binary '\0',NULL,NULL),('0b2c6acb-bf5f-468a-bedc-3d3af68d4f4e',NULL,NULL,'ilan','88ef0bf4-53d9-43e9-8d2f-9529d044c6fd',2,20,_binary '','2b803292-056d-4f21-82f9-40b47321f4d0',NULL),('105b05fd-2b3a-493e-9568-47c00758e305',NULL,'direct-grant-validate-username','master','885b6a46-61ab-47c1-8855-db1cd0bbdaab',0,10,_binary '\0',NULL,NULL),('1165403a-5a78-4f89-9e45-4d5ddb826a4d',NULL,'auth-username-password-form','ilan','f724b386-61b2-4d0d-b263-e250fef3c1f1',0,10,_binary '\0',NULL,NULL),('137d7412-1732-4cf3-91c2-9f5b5c414eab',NULL,'conditional-user-configured','ilan','385eb452-e907-4b92-96c7-cfe09684411a',0,10,_binary '\0',NULL,NULL),('148e2eb0-cff2-4c30-af27-e56a2f516b1b',NULL,'direct-grant-validate-otp','master','ad61f690-c549-447e-a7cf-457661b1e3fe',0,20,_binary '\0',NULL,NULL),('16d9bd62-4ace-412c-b921-11eb6afaa5d3',NULL,'client-jwt','ilan','33d3c79b-84e5-4dd2-8380-3f022fe456c8',2,20,_binary '\0',NULL,NULL),('1e894756-5dc8-4d9d-bbf9-08a3220a3e9a',NULL,NULL,'master','79094aa2-69cd-4172-8da5-a191490f0676',2,20,_binary '','b0a298c6-0769-4e79-a121-80790f821fc2',NULL),('211403f9-66fe-4caf-a11a-44fc6c878902',NULL,NULL,'ilan','bfa69f67-4a4f-4ef4-8d8e-38aa72b0d57b',1,20,_binary '','385eb452-e907-4b92-96c7-cfe09684411a',NULL),('215b7b60-c002-43ad-9d4b-568a39235006',NULL,'idp-create-user-if-unique','master','c14fd2f9-5371-4e47-9bcc-cdd877b90e80',2,10,_binary '\0',NULL,'7f3304f0-b0ed-4272-8b6f-ec1d95ecc94e'),('332e776d-5d04-4008-9f78-6caaf4f817ce',NULL,'auth-otp-form','master','a5c01347-b4ab-4a35-82c1-d9d1e481a5c2',0,20,_binary '\0',NULL,NULL),('349333eb-0a7f-4c2b-a12e-809cb2a1b996',NULL,'reset-credential-email','ilan','cba09e5d-b125-435e-a7a5-9f8fca64dc69',0,20,_binary '\0',NULL,NULL),('381b3eae-e4ce-4e63-a447-2c8578d505c8',NULL,'basic-auth','master','ebdc62f0-bbf4-464c-beb0-dbf0cd72f580',0,10,_binary '\0',NULL,NULL),('39d7ad8d-789e-4a3c-bb4e-119f35dced18',NULL,'registration-recaptcha-action','master','4d192389-fcec-421e-9ffe-289f8df216f6',3,60,_binary '\0',NULL,NULL),('3f4b984a-4ed2-48de-ae00-dcffdd47d9f9',NULL,'direct-grant-validate-username','ilan','a080a8d9-476d-405c-98dd-059dbfcd8191',0,10,_binary '\0',NULL,NULL),('48396aa4-2621-4554-b058-7cadbdf14d18',NULL,'identity-provider-redirector','ilan','f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04',2,25,_binary '\0',NULL,NULL),('4baafebf-c284-4ed9-b79b-9727d1c640b5',NULL,'conditional-user-configured','ilan','fd2a2268-00c5-41bc-8f31-aaa46b2f07b5',0,10,_binary '\0',NULL,NULL),('4cd3cb9d-4c8a-412f-bb8f-496aaafaed98',NULL,'reset-password','ilan','cba09e5d-b125-435e-a7a5-9f8fca64dc69',0,30,_binary '\0',NULL,NULL),('514f0d84-3b2c-43aa-a1a9-fab6e12bf906',NULL,'auth-cookie','ilan','f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04',2,10,_binary '\0',NULL,NULL),('53cb09f6-fe25-4f3c-a2e2-29b5fa1b0dcf',NULL,'basic-auth-otp','master','ebdc62f0-bbf4-464c-beb0-dbf0cd72f580',3,20,_binary '\0',NULL,NULL),('550384f7-5df8-421f-ada4-618e70a50df2',NULL,'idp-username-password-form','master','b0a298c6-0769-4e79-a121-80790f821fc2',0,10,_binary '\0',NULL,NULL),('5524770f-200f-463b-829c-2961dae7b791',NULL,'registration-password-action','master','4d192389-fcec-421e-9ffe-289f8df216f6',0,50,_binary '\0',NULL,NULL),('558a9be5-fad3-4a7c-8f92-85979fcd5995',NULL,'registration-page-form','master','64c689de-ad02-461f-8179-52be62144636',0,10,_binary '','4d192389-fcec-421e-9ffe-289f8df216f6',NULL),('567c7818-ee9f-4ef2-9a7b-4a1b9d43ee64',NULL,'auth-otp-form','ilan','fd2a2268-00c5-41bc-8f31-aaa46b2f07b5',0,20,_binary '\0',NULL,NULL),('56d6a005-b973-4109-b86a-37edcddc50f3',NULL,NULL,'ilan','2b803292-056d-4f21-82f9-40b47321f4d0',0,20,_binary '','32b52d24-854b-444d-946d-824921a450fb',NULL),('5809cf2f-d3ca-4ec2-94b8-9b68736eb7b8',NULL,'no-cookie-redirect','master','9f2653c8-7e1c-4c8a-9f87-a8315a732cd0',0,10,_binary '\0',NULL,NULL),('59676167-1d03-4587-8f35-4fee0e86ced9',NULL,NULL,'master','118311b9-8341-4312-9cc3-e23bc793f06e',0,20,_binary '','79094aa2-69cd-4172-8da5-a191490f0676',NULL),('5f05e73b-85ef-49f2-ace7-eda18d9ec2d6',NULL,NULL,'master','e9d7ec40-561f-491b-ad2b-deb801447d72',2,30,_binary '','2df0eb10-c747-4e37-9229-7a77af1952ff',NULL),('6201891a-19f4-4dec-bc0c-bec4f9efa157',NULL,'auth-spnego','ilan','aca454f4-8056-45c9-bf43-d4e353d1f73c',3,30,_binary '\0',NULL,NULL),('66a259ff-0d4c-4425-8cb8-ff238c7130e8',NULL,'reset-password','master','64669c18-d6a5-4dac-b5e3-05722d2b877a',0,30,_binary '\0',NULL,NULL),('698e7dd1-2fe4-4fe6-9bf7-185f6c5c4472',NULL,'conditional-user-configured','ilan','e919c68d-5e58-4b47-889a-575372a7a8f0',0,10,_binary '\0',NULL,NULL),('6b2b9b1a-6ead-43dc-8558-0063d61e7af9',NULL,'idp-review-profile','ilan','7f3f283d-da24-4d8c-a10d-f98398d7088b',0,10,_binary '\0',NULL,'e7f36ea7-0c32-4133-b162-f25c302f5c12'),('6dbdfa82-97a6-4868-8032-a88184f00637',NULL,'http-basic-authenticator','master','fa082ea5-2779-4e33-b69b-80ae9359f0df',0,10,_binary '\0',NULL,NULL),('6dbeabf9-bbc1-4011-98fd-a193e16a0ae3',NULL,'registration-page-form','ilan','ca13831a-c55e-4b96-b891-8dd9aa00718e',0,10,_binary '','a0bcd546-4e22-4d51-b322-e2b11bd3d644',NULL),('6ee8426d-57e8-423b-af67-296b06740ac3',NULL,'http-basic-authenticator','ilan','cefb4022-25d7-497e-8c25-53d718b45b1f',0,10,_binary '\0',NULL,NULL),('702ad7dd-d4c6-4de4-bb8c-f56548c398bb',NULL,'direct-grant-validate-password','master','885b6a46-61ab-47c1-8855-db1cd0bbdaab',0,20,_binary '\0',NULL,NULL),('708098fc-f72d-4645-8447-77c24a45eb19',NULL,NULL,'master','b0a298c6-0769-4e79-a121-80790f821fc2',1,20,_binary '','f7ea40cc-8008-4657-a227-20df043928c5',NULL),('70b4fbf2-1dc1-4973-a58f-2916a0588c18',NULL,'client-secret','master','e9bcde96-e117-4a3a-a944-9de7efe417a9',2,10,_binary '\0',NULL,NULL),('716f5fd6-15c3-4300-85c8-5279a45ad57d',NULL,'client-secret-jwt','master','e9bcde96-e117-4a3a-a944-9de7efe417a9',2,30,_binary '\0',NULL,NULL),('7249194c-8b3b-48cc-b55b-b7e9fd0ff153',NULL,'registration-password-action','ilan','a0bcd546-4e22-4d51-b322-e2b11bd3d644',0,50,_binary '\0',NULL,NULL),('75bdb718-94f3-4e03-9592-a603750d1017',NULL,'conditional-user-configured','master','ad61f690-c549-447e-a7cf-457661b1e3fe',0,10,_binary '\0',NULL,NULL),('7af5b63c-c431-4282-9072-0901c2ad35cd',NULL,'direct-grant-validate-password','ilan','a080a8d9-476d-405c-98dd-059dbfcd8191',0,20,_binary '\0',NULL,NULL),('7d9048ba-d572-4e68-8db0-a9c3435c048d',NULL,'docker-http-basic-authenticator','ilan','a8806c9e-0e9e-4a0a-b63e-d6b2a2b16772',0,10,_binary '\0',NULL,NULL),('7ddfa684-b9bb-4c6e-9718-464a48141152',NULL,NULL,'ilan','9f4b7bd3-b690-4669-87b9-25482bb7171b',0,20,_binary '','aca454f4-8056-45c9-bf43-d4e353d1f73c',NULL),('82ea85f3-2223-42ef-9cc7-de3cf135855f',NULL,'auth-otp-form','ilan','385eb452-e907-4b92-96c7-cfe09684411a',0,20,_binary '\0',NULL,NULL),('84d2e002-dd2c-4118-a971-cb5456bf9fda',NULL,'registration-user-creation','ilan','a0bcd546-4e22-4d51-b322-e2b11bd3d644',0,20,_binary '\0',NULL,NULL),('85a89b8c-1aca-4999-8e91-9e079c562ea8',NULL,'idp-create-user-if-unique','ilan','88ef0bf4-53d9-43e9-8d2f-9529d044c6fd',2,10,_binary '\0',NULL,'5f7f337f-826e-484e-9df7-2b682349388c'),('873e2c59-b0ba-4546-b61f-3962b857b2cb',NULL,NULL,'ilan','f724b386-61b2-4d0d-b263-e250fef3c1f1',1,20,_binary '','fd2a2268-00c5-41bc-8f31-aaa46b2f07b5',NULL),('8f468dd8-5e19-49b3-9696-deda84600f08',NULL,'no-cookie-redirect','ilan','9f4b7bd3-b690-4669-87b9-25482bb7171b',0,10,_binary '\0',NULL,NULL),('91d476bc-62c7-4772-a194-49fa91ecffe6',NULL,'client-secret','ilan','33d3c79b-84e5-4dd2-8380-3f022fe456c8',2,10,_binary '\0',NULL,NULL),('93eb996f-f437-446f-ad34-06eb2057de16',NULL,'reset-credential-email','master','64669c18-d6a5-4dac-b5e3-05722d2b877a',0,20,_binary '\0',NULL,NULL),('97294a48-550d-441a-8f3a-a1df4375f3e4',NULL,'docker-http-basic-authenticator','master','fc2f5f6d-08a1-473d-be5e-b9feedafd058',0,10,_binary '\0',NULL,NULL),('9881e076-516f-4085-b1bf-60a63a296a05',NULL,NULL,'ilan','a080a8d9-476d-405c-98dd-059dbfcd8191',1,30,_binary '','e919c68d-5e58-4b47-889a-575372a7a8f0',NULL),('9a1aadce-6324-45d5-a7f2-273e5d6ec5cb',NULL,'basic-auth','ilan','aca454f4-8056-45c9-bf43-d4e353d1f73c',0,10,_binary '\0',NULL,NULL),('9ba5fe0e-7eff-4d07-af25-788a2cbd9c77',NULL,'direct-grant-validate-otp','ilan','e919c68d-5e58-4b47-889a-575372a7a8f0',0,20,_binary '\0',NULL,NULL),('a88fcac4-c6ca-4c1e-8a5a-358949d5cf02',NULL,'auth-spnego','master','ebdc62f0-bbf4-464c-beb0-dbf0cd72f580',3,30,_binary '\0',NULL,NULL),('ab0859db-18d8-48ca-ab7e-51f74a9ae7a9',NULL,'idp-confirm-link','ilan','2b803292-056d-4f21-82f9-40b47321f4d0',0,10,_binary '\0',NULL,NULL),('ad7be5c6-4f5f-48e0-a098-2025db4dbe5f',NULL,'idp-email-verification','ilan','32b52d24-854b-444d-946d-824921a450fb',2,10,_binary '\0',NULL,NULL),('af9041f5-4201-4682-b7a6-bd8995383f24',NULL,'auth-username-password-form','master','2df0eb10-c747-4e37-9229-7a77af1952ff',0,10,_binary '\0',NULL,NULL),('afa0a211-add4-4f28-af55-3205136bb66a',NULL,'reset-credentials-choose-user','master','64669c18-d6a5-4dac-b5e3-05722d2b877a',0,10,_binary '\0',NULL,NULL),('b224f18d-7d49-46f0-a3b9-4fb58edc9a9c',NULL,'idp-confirm-link','master','118311b9-8341-4312-9cc3-e23bc793f06e',0,10,_binary '\0',NULL,NULL),('b80ff750-512f-48d7-adb7-a86866d23df0',NULL,NULL,'ilan','f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04',2,30,_binary '','f724b386-61b2-4d0d-b263-e250fef3c1f1',NULL),('baed2798-fd9b-46f7-ab63-095b236f3e49',NULL,'client-x509','ilan','33d3c79b-84e5-4dd2-8380-3f022fe456c8',2,40,_binary '\0',NULL,NULL),('bb368c67-a586-4cd8-8026-0e6ddaad3f99',NULL,'reset-otp','ilan','096b5991-aa98-4bc5-bf72-f3fe5b5b7d82',0,20,_binary '\0',NULL,NULL),('c3b0e72e-1d8d-4868-a52e-8f9df645f7bd',NULL,NULL,'ilan','7f3f283d-da24-4d8c-a10d-f98398d7088b',0,20,_binary '','88ef0bf4-53d9-43e9-8d2f-9529d044c6fd',NULL),('c5753f9c-f591-488a-b5d3-719275d1d251',NULL,'auth-spnego','ilan','f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04',3,20,_binary '\0',NULL,NULL),('c7f3955c-b31c-4ab3-8251-45c8267b60e0',NULL,'registration-profile-action','master','4d192389-fcec-421e-9ffe-289f8df216f6',0,40,_binary '\0',NULL,NULL),('c869d82a-a08a-4ebe-8b65-cd3d82075358',NULL,NULL,'master','c14fd2f9-5371-4e47-9bcc-cdd877b90e80',2,20,_binary '','118311b9-8341-4312-9cc3-e23bc793f06e',NULL),('c8d599e9-ded2-413b-a2cc-6e13fc16f8c9',NULL,'client-jwt','master','e9bcde96-e117-4a3a-a944-9de7efe417a9',2,20,_binary '\0',NULL,NULL),('cbd38e36-1db4-430e-a363-1c893de5b371',NULL,'registration-user-creation','master','4d192389-fcec-421e-9ffe-289f8df216f6',0,20,_binary '\0',NULL,NULL),('d4a5373d-c856-491f-8b4b-fdce617a521d',NULL,NULL,'master','2df0eb10-c747-4e37-9229-7a77af1952ff',1,20,_binary '','a5c01347-b4ab-4a35-82c1-d9d1e481a5c2',NULL),('d5e732d6-7ea5-4496-a984-d3dbc3afff2b',NULL,'reset-credentials-choose-user','ilan','cba09e5d-b125-435e-a7a5-9f8fca64dc69',0,10,_binary '\0',NULL,NULL),('d78fcfa3-48d5-4258-b204-86cd99074fb8',NULL,'conditional-user-configured','master','f7ea40cc-8008-4657-a227-20df043928c5',0,10,_binary '\0',NULL,NULL),('de58a289-9138-47b9-bfbe-a6fa2fd44617',NULL,'client-secret-jwt','ilan','33d3c79b-84e5-4dd2-8380-3f022fe456c8',2,30,_binary '\0',NULL,NULL),('df81ca9d-6e38-43e6-a415-a68d68ef6cfe',NULL,'conditional-user-configured','master','eb8cc3a4-248b-4774-8151-23c1c143556c',0,10,_binary '\0',NULL,NULL),('e01a21f7-ad6f-42df-9f2b-4000ca892a26',NULL,'reset-otp','master','eb8cc3a4-248b-4774-8151-23c1c143556c',0,20,_binary '\0',NULL,NULL),('e1a1eef8-61cf-4677-91b3-fb957cd05f85',NULL,'idp-review-profile','master','d26b0c8f-1476-4098-9894-a1c508343985',0,10,_binary '\0',NULL,'1f644ef7-7db4-4e75-a1c3-1e6dbd6da2e8'),('e30dac3f-aa0e-48d7-8d3b-3280f733fc95',NULL,'registration-recaptcha-action','ilan','a0bcd546-4e22-4d51-b322-e2b11bd3d644',3,60,_binary '\0',NULL,NULL),('e51d69a0-008f-44f9-911f-0be86398f24d',NULL,'basic-auth-otp','ilan','aca454f4-8056-45c9-bf43-d4e353d1f73c',3,20,_binary '\0',NULL,NULL),('e863d8bf-4144-4e7c-941f-bc7147e7c9cf',NULL,'conditional-user-configured','ilan','096b5991-aa98-4bc5-bf72-f3fe5b5b7d82',0,10,_binary '\0',NULL,NULL),('e86e7a15-2784-4898-a405-14eb1db4d656',NULL,'idp-email-verification','master','79094aa2-69cd-4172-8da5-a191490f0676',2,10,_binary '\0',NULL,NULL),('ebdb2e23-3a5e-469d-b51a-bee8bc66fc7b',NULL,NULL,'ilan','32b52d24-854b-444d-946d-824921a450fb',2,20,_binary '','bfa69f67-4a4f-4ef4-8d8e-38aa72b0d57b',NULL),('ed28d48d-bd81-4253-ad44-b32c92e8cf2e',NULL,'client-x509','master','e9bcde96-e117-4a3a-a944-9de7efe417a9',2,40,_binary '\0',NULL,NULL),('eea6e6f5-0c56-465b-8394-3e6199d35843',NULL,NULL,'master','885b6a46-61ab-47c1-8855-db1cd0bbdaab',1,30,_binary '','ad61f690-c549-447e-a7cf-457661b1e3fe',NULL),('effda65a-5ddd-46a1-9fc7-77fcf4c63b0a',NULL,NULL,'ilan','cba09e5d-b125-435e-a7a5-9f8fca64dc69',1,40,_binary '','096b5991-aa98-4bc5-bf72-f3fe5b5b7d82',NULL),('f498a54f-0524-4a38-b677-02478eb400b7',NULL,'registration-profile-action','ilan','a0bcd546-4e22-4d51-b322-e2b11bd3d644',0,40,_binary '\0',NULL,NULL),('f51e6aad-2be2-4679-95b6-220005367a33',NULL,'conditional-user-configured','master','a5c01347-b4ab-4a35-82c1-d9d1e481a5c2',0,10,_binary '\0',NULL,NULL),('f7e13365-6e91-429a-b161-04a5c598c246',NULL,'auth-otp-form','master','f7ea40cc-8008-4657-a227-20df043928c5',0,20,_binary '\0',NULL,NULL),('fac1bbd6-a612-4a80-a292-73f2fa4400aa',NULL,'auth-cookie','master','e9d7ec40-561f-491b-ad2b-deb801447d72',2,10,_binary '\0',NULL,NULL),('facb5a1a-e211-44bc-aa92-8dd4ccf6864d',NULL,NULL,'master','d26b0c8f-1476-4098-9894-a1c508343985',0,20,_binary '','c14fd2f9-5371-4e47-9bcc-cdd877b90e80',NULL),('ffd91452-8bc2-4bb2-9c00-d437afdc18d8',NULL,'idp-username-password-form','ilan','bfa69f67-4a4f-4ef4-8d8e-38aa72b0d57b',0,10,_binary '\0',NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('096b5991-aa98-4bc5-bf72-f3fe5b5b7d82','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','ilan','basic-flow',_binary '\0',_binary ''),('118311b9-8341-4312-9cc3-e23bc793f06e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('2b803292-056d-4f21-82f9-40b47321f4d0','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','ilan','basic-flow',_binary '\0',_binary ''),('2df0eb10-c747-4e37-9229-7a77af1952ff','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('32b52d24-854b-444d-946d-824921a450fb','Account verification options','Method with which to verity the existing account','ilan','basic-flow',_binary '\0',_binary ''),('33d3c79b-84e5-4dd2-8380-3f022fe456c8','clients','Base authentication for clients','ilan','client-flow',_binary '',_binary ''),('385eb452-e907-4b92-96c7-cfe09684411a','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','ilan','basic-flow',_binary '\0',_binary ''),('4d192389-fcec-421e-9ffe-289f8df216f6','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('64669c18-d6a5-4dac-b5e3-05722d2b877a','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('64c689de-ad02-461f-8179-52be62144636','registration','registration flow','master','basic-flow',_binary '',_binary ''),('79094aa2-69cd-4172-8da5-a191490f0676','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('7f3f283d-da24-4d8c-a10d-f98398d7088b','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','ilan','basic-flow',_binary '',_binary ''),('885b6a46-61ab-47c1-8855-db1cd0bbdaab','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('88ef0bf4-53d9-43e9-8d2f-9529d044c6fd','User creation or linking','Flow for the existing/non-existing user alternatives','ilan','basic-flow',_binary '\0',_binary ''),('9f2653c8-7e1c-4c8a-9f87-a8315a732cd0','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('9f4b7bd3-b690-4669-87b9-25482bb7171b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','ilan','basic-flow',_binary '',_binary ''),('a080a8d9-476d-405c-98dd-059dbfcd8191','direct grant','OpenID Connect Resource Owner Grant','ilan','basic-flow',_binary '',_binary ''),('a0bcd546-4e22-4d51-b322-e2b11bd3d644','registration form','registration form','ilan','form-flow',_binary '\0',_binary ''),('a5c01347-b4ab-4a35-82c1-d9d1e481a5c2','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('a8806c9e-0e9e-4a0a-b63e-d6b2a2b16772','docker auth','Used by Docker clients to authenticate against the IDP','ilan','basic-flow',_binary '',_binary ''),('aca454f4-8056-45c9-bf43-d4e353d1f73c','Authentication Options','Authentication options.','ilan','basic-flow',_binary '\0',_binary ''),('ad61f690-c549-447e-a7cf-457661b1e3fe','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('b0a298c6-0769-4e79-a121-80790f821fc2','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('bfa69f67-4a4f-4ef4-8d8e-38aa72b0d57b','Verify Existing Account by Re-authentication','Reauthentication of existing account','ilan','basic-flow',_binary '\0',_binary ''),('c14fd2f9-5371-4e47-9bcc-cdd877b90e80','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('ca13831a-c55e-4b96-b891-8dd9aa00718e','registration','registration flow','ilan','basic-flow',_binary '',_binary ''),('cba09e5d-b125-435e-a7a5-9f8fca64dc69','reset credentials','Reset credentials for a user if they forgot their password or something','ilan','basic-flow',_binary '',_binary ''),('cefb4022-25d7-497e-8c25-53d718b45b1f','saml ecp','SAML ECP Profile Authentication Flow','ilan','basic-flow',_binary '',_binary ''),('d26b0c8f-1476-4098-9894-a1c508343985','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('e919c68d-5e58-4b47-889a-575372a7a8f0','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','ilan','basic-flow',_binary '\0',_binary ''),('e9bcde96-e117-4a3a-a944-9de7efe417a9','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('e9d7ec40-561f-491b-ad2b-deb801447d72','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('eb8cc3a4-248b-4774-8151-23c1c143556c','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('ebdc62f0-bbf4-464c-beb0-dbf0cd72f580','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('f724b386-61b2-4d0d-b263-e250fef3c1f1','forms','Username, password, otp and other auth forms.','ilan','basic-flow',_binary '\0',_binary ''),('f7ea40cc-8008-4657-a227-20df043928c5','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04','browser','browser based authentication','ilan','basic-flow',_binary '',_binary ''),('fa082ea5-2779-4e33-b69b-80ae9359f0df','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('fc2f5f6d-08a1-473d-be5e-b9feedafd058','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('fd2a2268-00c5-41bc-8f31-aaa46b2f07b5','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','ilan','basic-flow',_binary '\0',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('1f644ef7-7db4-4e75-a1c3-1e6dbd6da2e8','review profile config','master'),('5f7f337f-826e-484e-9df7-2b682349388c','create unique user config','ilan'),('7f3304f0-b0ed-4272-8b6f-ec1d95ecc94e','create unique user config','master'),('e7f36ea7-0c32-4133-b162-f25c302f5c12','review profile config','ilan');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('1f644ef7-7db4-4e75-a1c3-1e6dbd6da2e8','missing','update.profile.on.first.login'),('5f7f337f-826e-484e-9df7-2b682349388c','false','require.password.update.after.registration'),('7f3304f0-b0ed-4272-8b6f-ec1d95ecc94e','false','require.password.update.after.registration'),('e7f36ea7-0c32-4133-b162-f25c302f5c12','missing','update.profile.on.first.login');
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
INSERT INTO `CLIENT` VALUES ('022d79a4-c939-4955-8b37-03e37198ad42',_binary '',_binary '','f1-grafana',0,_binary '\0','bN1fyboNcqcNjQhjabGJj8uz5x6JsHQm','/gfsys/login/generic_oauth',_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d',_binary '',_binary '','f1-manta-stazione-1',0,_binary '\0','tZLSR2B9n76rL96MU4O5zs5ZKwAisFn6',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0',_binary '',_binary '','f1-manta_stazione_1_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0','Front End Stazione 1',_binary '\0','client-secret',NULL,'Front End Stazione 1',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1',_binary '',_binary '','f5-plcsimulator',0,_binary '\0','vecfiv9Nd1o3G3AbtOCfT3GeEDIVMAf4',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/ilan/account/',_binary '\0',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('10afe5fe-3015-4fa4-8691-3d2c44256427',_binary '',_binary '','f5-manta-traceability-viewer',0,_binary '\0','U5RJP5DySzZWu6us3RNIYE7vxcL9oCR2',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012',_binary '',_binary '','f5-gfsys',0,_binary '\0','X9NnTgDyggnj2EpsBMNreXNX76QIFEqw','/gfsys/login/generic_oauth',_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('1f372198-46d2-4260-b7d2-97ae1559984f',_binary '',_binary '','f5-manta-memdata-service',0,_binary '\0','EucQ38OMXpM4slVKPr9RUsTFLunmqA1T',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('1ffe0269-47db-40b4-a10f-d8ed839032b8',_binary '',_binary '','f1-counters-app',0,_binary '\0','nD6r1zsrdxZIKtKVwTa8DL31A8cqJMFW',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a',_binary '',_binary '','f1-manta-modbus-services',0,_binary '\0','c844nEa67HEjiPrksqNg78X2v0WyG1xB',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d',_binary '',_binary '','f1-manta-stazione-6',0,_binary '\0','KgkgbFUeuCRjutrm0WfZc7gjY4GHSq5M',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3061d99f-7724-4bfc-af02-66ff054dd130',_binary '',_binary '','f5-manta_stazione_5_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3233bbe5-5b78-4de0-aecc-3f84f311c029',_binary '',_binary '','f1-grafanaproxy',0,_binary '\0','6FqvPxekanEJ4SvmShmM72qu7FrnuJrt',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3e619479-33ad-4782-8094-85f0b163c457',_binary '',_binary '','webmain_app_dev',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3ee78251-694a-40a4-811a-4d7a2b16d739',_binary '',_binary '','f5-manta-stazione-2',0,_binary '\0','E35dHDnr80Z2Hx0WYrBvFuEhzoIkELRn',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('436c8e6b-958f-4053-8771-b8b221a0e1fd',_binary '',_binary '','f5-manta-analytics',0,_binary '\0','rsJWxbQaVW8Pixj3sQFeWeyeI73M2slu',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('57968d8e-c609-4e96-9367-3e7c56c2420f',_binary '',_binary '','f5-manta_stazione_4_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650',_binary '',_binary '','f1-manta_stazione_6_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '',_binary '','f1-manta-traceability-app',0,_binary '\0','Rp6e3nOxJnYaNpmsoVfzt2x533KgPpXM',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('6de38ed4-e035-4404-9e67-ad075ee3b788',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',_binary '',_binary '','f5-manta-stazione-3',0,_binary '\0','Zbd3xzO1QtkUCCEeImuwGL6G7e0fkRsO',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('793d1977-08f0-4766-8c19-50f970b4b0e6',_binary '',_binary '','f5-counters-app',0,_binary '\0','fbMgCIOe1lcNNLchjYtZ7oPnzid5eNb6',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('7a3a7598-71c8-484f-9d07-6805d8f362d4',_binary '',_binary '','f5-manta-modbus-services',0,_binary '\0','vOssPOHJNpCGwTttiyXdOgfCLgUPY56C',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('7f8dd358-c87f-4dc1-a158-dde7c259d737',_binary '',_binary '','f5-manta_stazione_1_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0','Front End Stazione 1',_binary '\0','client-secret',NULL,'Front End Stazione 1',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',_binary '',_binary '','f5-manta-memdata-lavorazione',0,_binary '\0','jGrmEA8nn1YOlpCl1hTzf2q8WI6Vq96x',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('9036c717-132d-401e-9a4c-a9d810fd20ea',_binary '',_binary '','f5-manta-stazione-6',0,_binary '\0','2OyELIwGjTjujgjpUrdxkyTFTUwC0XUl',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '',_binary '','f5-smartsight_frontend',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742',_binary '',_binary '','f5-grafanaproxy',0,_binary '\0','UxfzKTvuWayHx2OAqTvR9ErANoMuYtKS',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('b0053e68-6374-4d95-8f5d-fdd03f59f512',_binary '',_binary '','f1-manta-traceability-viewer',0,_binary '\0','yJ55AR8Axou8SR4tssshJIM458WqusRB',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d',_binary '',_binary '','f5-manta-stazione-1',0,_binary '\0','RWaS1S3hTCtqyUSnPccrrcgq45JUdzzy',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e',_binary '',_binary '','webmain',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '',_binary '','f1-smartsight_frontend',0,_binary '',NULL,NULL,_binary '\0','',_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c1becbf8-bb52-474d-b54e-375b985048e4',_binary '',_binary '','f5-manta_stazione_6_fe',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('cac04663-a452-4803-baa4-e677f0ab16e0',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/ilan/console/',_binary '\0',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/ilan/account/',_binary '\0',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',_binary '',_binary '','f1-gfsys',0,_binary '\0','8kmkrAxuxqKNOWpOEYmi6gApjqjkdlIM','/gfsys/login/generic_oauth',_binary '\0','',_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '',_binary '','f5-manta-traceability-app',0,_binary '\0','7pLA8FxBy2jTvHzWplLIteOz8sLXzIxt',NULL,_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ilan','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '',_binary '\0','ilan-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','ilan Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fc3586aa-ec51-4500-ae15-902b9d10cefe',_binary '',_binary '','f5-grafana',0,_binary '\0','BdHe9pmwXlerr46pl8KVXVfeT5IYhuhF','/gfsys/login/generic_oauth',_binary '\0',NULL,_binary '\0','ilan','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('fc401ffd-dad4-45df-923a-1186c09ef560',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('022d79a4-c939-4955-8b37-03e37198ad42','false','backchannel.logout.revoke.offline.tokens'),('022d79a4-c939-4955-8b37-03e37198ad42','true','backchannel.logout.session.required'),('022d79a4-c939-4955-8b37-03e37198ad42','false','client_credentials.use_refresh_token'),('022d79a4-c939-4955-8b37-03e37198ad42','false','display.on.consent.screen'),('022d79a4-c939-4955-8b37-03e37198ad42','false','exclude.session.state.from.auth.response'),('022d79a4-c939-4955-8b37-03e37198ad42','false','id.token.as.detached.signature'),('022d79a4-c939-4955-8b37-03e37198ad42','false','oauth2.device.authorization.grant.enabled'),('022d79a4-c939-4955-8b37-03e37198ad42','false','oidc.ciba.grant.enabled'),('022d79a4-c939-4955-8b37-03e37198ad42','false','require.pushed.authorization.requests'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml_force_name_id_format'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.artifact.binding'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.assertion.signature'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.authnstatement'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.client.signature'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.encrypt'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.force.post.binding'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.multivalued.roles'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.onetimeuse.condition'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.server.signature'),('022d79a4-c939-4955-8b37-03e37198ad42','false','saml.server.signature.keyinfo.ext'),('022d79a4-c939-4955-8b37-03e37198ad42','false','tls.client.certificate.bound.access.tokens'),('022d79a4-c939-4955-8b37-03e37198ad42','true','use.refresh.tokens'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','backchannel.logout.revoke.offline.tokens'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','true','backchannel.logout.session.required'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','client_credentials.use_refresh_token'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','display.on.consent.screen'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','exclude.session.state.from.auth.response'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','id.token.as.detached.signature'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','oauth2.device.authorization.grant.enabled'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','oidc.ciba.grant.enabled'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','require.pushed.authorization.requests'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml_force_name_id_format'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.artifact.binding'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.assertion.signature'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.authnstatement'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.client.signature'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.encrypt'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.force.post.binding'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.multivalued.roles'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.onetimeuse.condition'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.server.signature'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','saml.server.signature.keyinfo.ext'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','false','tls.client.certificate.bound.access.tokens'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','true','use.refresh.tokens'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','backchannel.logout.revoke.offline.tokens'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','true','backchannel.logout.session.required'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','client_credentials.use_refresh_token'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','display.on.consent.screen'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','exclude.session.state.from.auth.response'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','id.token.as.detached.signature'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','oauth2.device.authorization.grant.enabled'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','oidc.ciba.grant.enabled'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','require.pushed.authorization.requests'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml_force_name_id_format'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.artifact.binding'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.assertion.signature'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.authnstatement'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.client.signature'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.encrypt'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.force.post.binding'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.multivalued.roles'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.onetimeuse.condition'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.server.signature'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','saml.server.signature.keyinfo.ext'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','false','tls.client.certificate.bound.access.tokens'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','true','use.refresh.tokens'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','backchannel.logout.revoke.offline.tokens'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','true','backchannel.logout.session.required'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','client_credentials.use_refresh_token'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','display.on.consent.screen'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','exclude.session.state.from.auth.response'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','id.token.as.detached.signature'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','oauth2.device.authorization.grant.enabled'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','oidc.ciba.grant.enabled'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','require.pushed.authorization.requests'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml_force_name_id_format'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.artifact.binding'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.assertion.signature'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.authnstatement'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.client.signature'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.encrypt'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.force.post.binding'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.multivalued.roles'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.onetimeuse.condition'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.server.signature'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','saml.server.signature.keyinfo.ext'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','false','tls.client.certificate.bound.access.tokens'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','true','use.refresh.tokens'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','backchannel.logout.revoke.offline.tokens'),('10afe5fe-3015-4fa4-8691-3d2c44256427','true','backchannel.logout.session.required'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','client_credentials.use_refresh_token'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','display.on.consent.screen'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','exclude.session.state.from.auth.response'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','id.token.as.detached.signature'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','oauth2.device.authorization.grant.enabled'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','oidc.ciba.grant.enabled'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','require.pushed.authorization.requests'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml_force_name_id_format'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.artifact.binding'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.assertion.signature'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.authnstatement'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.client.signature'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.encrypt'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.force.post.binding'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.multivalued.roles'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.onetimeuse.condition'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.server.signature'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','saml.server.signature.keyinfo.ext'),('10afe5fe-3015-4fa4-8691-3d2c44256427','false','tls.client.certificate.bound.access.tokens'),('10afe5fe-3015-4fa4-8691-3d2c44256427','true','use.refresh.tokens'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','backchannel.logout.revoke.offline.tokens'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','true','backchannel.logout.session.required'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','client_credentials.use_refresh_token'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','display.on.consent.screen'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','exclude.session.state.from.auth.response'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','id.token.as.detached.signature'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','oauth2.device.authorization.grant.enabled'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','oidc.ciba.grant.enabled'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','require.pushed.authorization.requests'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml_force_name_id_format'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.artifact.binding'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.assertion.signature'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.authnstatement'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.client.signature'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.encrypt'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.force.post.binding'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.multivalued.roles'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.onetimeuse.condition'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.server.signature'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','saml.server.signature.keyinfo.ext'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','false','tls.client.certificate.bound.access.tokens'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','true','use.refresh.tokens'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','backchannel.logout.revoke.offline.tokens'),('1f372198-46d2-4260-b7d2-97ae1559984f','true','backchannel.logout.session.required'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','client_credentials.use_refresh_token'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','display.on.consent.screen'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','exclude.session.state.from.auth.response'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','id.token.as.detached.signature'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','oauth2.device.authorization.grant.enabled'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','oidc.ciba.grant.enabled'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','require.pushed.authorization.requests'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml_force_name_id_format'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.artifact.binding'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.assertion.signature'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.authnstatement'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.client.signature'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.encrypt'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.force.post.binding'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.multivalued.roles'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.onetimeuse.condition'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.server.signature'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','saml.server.signature.keyinfo.ext'),('1f372198-46d2-4260-b7d2-97ae1559984f','false','tls.client.certificate.bound.access.tokens'),('1f372198-46d2-4260-b7d2-97ae1559984f','true','use.refresh.tokens'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','backchannel.logout.revoke.offline.tokens'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','true','backchannel.logout.session.required'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','client_credentials.use_refresh_token'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','display.on.consent.screen'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','exclude.session.state.from.auth.response'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','id.token.as.detached.signature'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','oauth2.device.authorization.grant.enabled'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','oidc.ciba.grant.enabled'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','require.pushed.authorization.requests'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml_force_name_id_format'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.artifact.binding'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.assertion.signature'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.authnstatement'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.client.signature'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.encrypt'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.force.post.binding'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.multivalued.roles'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.onetimeuse.condition'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.server.signature'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','saml.server.signature.keyinfo.ext'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','false','tls.client.certificate.bound.access.tokens'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','true','use.refresh.tokens'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','backchannel.logout.revoke.offline.tokens'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','true','backchannel.logout.session.required'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','client_credentials.use_refresh_token'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','display.on.consent.screen'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','exclude.session.state.from.auth.response'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','id.token.as.detached.signature'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','oauth2.device.authorization.grant.enabled'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','oidc.ciba.grant.enabled'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','require.pushed.authorization.requests'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml_force_name_id_format'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.artifact.binding'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.assertion.signature'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.authnstatement'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.client.signature'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.encrypt'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.force.post.binding'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.multivalued.roles'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.onetimeuse.condition'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.server.signature'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','saml.server.signature.keyinfo.ext'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','false','tls.client.certificate.bound.access.tokens'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','true','use.refresh.tokens'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','backchannel.logout.revoke.offline.tokens'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','true','backchannel.logout.session.required'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','client_credentials.use_refresh_token'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','display.on.consent.screen'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','exclude.session.state.from.auth.response'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','id.token.as.detached.signature'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','oauth2.device.authorization.grant.enabled'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','oidc.ciba.grant.enabled'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','require.pushed.authorization.requests'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml_force_name_id_format'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.artifact.binding'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.assertion.signature'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.authnstatement'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.client.signature'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.encrypt'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.force.post.binding'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.multivalued.roles'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.onetimeuse.condition'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.server.signature'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','saml.server.signature.keyinfo.ext'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','false','tls.client.certificate.bound.access.tokens'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','true','use.refresh.tokens'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','backchannel.logout.revoke.offline.tokens'),('3061d99f-7724-4bfc-af02-66ff054dd130','true','backchannel.logout.session.required'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','client_credentials.use_refresh_token'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','display.on.consent.screen'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','exclude.session.state.from.auth.response'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','id.token.as.detached.signature'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','oauth2.device.authorization.grant.enabled'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','oidc.ciba.grant.enabled'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','require.pushed.authorization.requests'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml_force_name_id_format'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.artifact.binding'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.assertion.signature'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.authnstatement'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.client.signature'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.encrypt'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.force.post.binding'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.multivalued.roles'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.onetimeuse.condition'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.server.signature'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','saml.server.signature.keyinfo.ext'),('3061d99f-7724-4bfc-af02-66ff054dd130','false','tls.client.certificate.bound.access.tokens'),('3061d99f-7724-4bfc-af02-66ff054dd130','true','use.refresh.tokens'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','backchannel.logout.revoke.offline.tokens'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','true','backchannel.logout.session.required'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','client_credentials.use_refresh_token'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','display.on.consent.screen'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','exclude.session.state.from.auth.response'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','id.token.as.detached.signature'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','oauth2.device.authorization.grant.enabled'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','oidc.ciba.grant.enabled'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','require.pushed.authorization.requests'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml_force_name_id_format'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.artifact.binding'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.assertion.signature'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.authnstatement'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.client.signature'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.encrypt'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.force.post.binding'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.multivalued.roles'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.onetimeuse.condition'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.server.signature'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','saml.server.signature.keyinfo.ext'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','false','tls.client.certificate.bound.access.tokens'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','true','use.refresh.tokens'),('3e619479-33ad-4782-8094-85f0b163c457','false','backchannel.logout.revoke.offline.tokens'),('3e619479-33ad-4782-8094-85f0b163c457','true','backchannel.logout.session.required'),('3e619479-33ad-4782-8094-85f0b163c457','false','client_credentials.use_refresh_token'),('3e619479-33ad-4782-8094-85f0b163c457','false','display.on.consent.screen'),('3e619479-33ad-4782-8094-85f0b163c457','false','exclude.session.state.from.auth.response'),('3e619479-33ad-4782-8094-85f0b163c457','false','id.token.as.detached.signature'),('3e619479-33ad-4782-8094-85f0b163c457','false','oauth2.device.authorization.grant.enabled'),('3e619479-33ad-4782-8094-85f0b163c457','false','oidc.ciba.grant.enabled'),('3e619479-33ad-4782-8094-85f0b163c457','false','require.pushed.authorization.requests'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml_force_name_id_format'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.artifact.binding'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.assertion.signature'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.authnstatement'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.client.signature'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.encrypt'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.force.post.binding'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.multivalued.roles'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.onetimeuse.condition'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.server.signature'),('3e619479-33ad-4782-8094-85f0b163c457','false','saml.server.signature.keyinfo.ext'),('3e619479-33ad-4782-8094-85f0b163c457','false','tls.client.certificate.bound.access.tokens'),('3e619479-33ad-4782-8094-85f0b163c457','true','use.refresh.tokens'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','backchannel.logout.revoke.offline.tokens'),('3ee78251-694a-40a4-811a-4d7a2b16d739','true','backchannel.logout.session.required'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','client_credentials.use_refresh_token'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','display.on.consent.screen'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','exclude.session.state.from.auth.response'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','id.token.as.detached.signature'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','oauth2.device.authorization.grant.enabled'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','oidc.ciba.grant.enabled'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','require.pushed.authorization.requests'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml_force_name_id_format'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.artifact.binding'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.assertion.signature'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.authnstatement'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.client.signature'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.encrypt'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.force.post.binding'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.multivalued.roles'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.onetimeuse.condition'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.server.signature'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','saml.server.signature.keyinfo.ext'),('3ee78251-694a-40a4-811a-4d7a2b16d739','false','tls.client.certificate.bound.access.tokens'),('3ee78251-694a-40a4-811a-4d7a2b16d739','true','use.refresh.tokens'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','backchannel.logout.revoke.offline.tokens'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','true','backchannel.logout.session.required'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','client_credentials.use_refresh_token'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','display.on.consent.screen'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','exclude.session.state.from.auth.response'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','id.token.as.detached.signature'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','oauth2.device.authorization.grant.enabled'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','oidc.ciba.grant.enabled'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','require.pushed.authorization.requests'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml_force_name_id_format'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.artifact.binding'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.assertion.signature'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.authnstatement'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.client.signature'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.encrypt'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.force.post.binding'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.multivalued.roles'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.onetimeuse.condition'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.server.signature'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','saml.server.signature.keyinfo.ext'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','false','tls.client.certificate.bound.access.tokens'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','true','use.refresh.tokens'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','backchannel.logout.revoke.offline.tokens'),('57968d8e-c609-4e96-9367-3e7c56c2420f','true','backchannel.logout.session.required'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','client_credentials.use_refresh_token'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','display.on.consent.screen'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','exclude.session.state.from.auth.response'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','id.token.as.detached.signature'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','oauth2.device.authorization.grant.enabled'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','oidc.ciba.grant.enabled'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','require.pushed.authorization.requests'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml_force_name_id_format'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.artifact.binding'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.assertion.signature'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.authnstatement'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.client.signature'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.encrypt'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.force.post.binding'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.multivalued.roles'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.onetimeuse.condition'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.server.signature'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','saml.server.signature.keyinfo.ext'),('57968d8e-c609-4e96-9367-3e7c56c2420f','false','tls.client.certificate.bound.access.tokens'),('57968d8e-c609-4e96-9367-3e7c56c2420f','true','use.refresh.tokens'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','backchannel.logout.revoke.offline.tokens'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','true','backchannel.logout.session.required'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','client_credentials.use_refresh_token'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','display.on.consent.screen'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','exclude.session.state.from.auth.response'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','id.token.as.detached.signature'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','oauth2.device.authorization.grant.enabled'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','oidc.ciba.grant.enabled'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','require.pushed.authorization.requests'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml_force_name_id_format'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.artifact.binding'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.assertion.signature'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.authnstatement'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.client.signature'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.encrypt'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.force.post.binding'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.multivalued.roles'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.onetimeuse.condition'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.server.signature'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','saml.server.signature.keyinfo.ext'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','false','tls.client.certificate.bound.access.tokens'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','true','use.refresh.tokens'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','backchannel.logout.revoke.offline.tokens'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','true','backchannel.logout.session.required'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','client_credentials.use_refresh_token'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','display.on.consent.screen'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','exclude.session.state.from.auth.response'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','id.token.as.detached.signature'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','oauth2.device.authorization.grant.enabled'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','oidc.ciba.grant.enabled'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','require.pushed.authorization.requests'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml_force_name_id_format'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.artifact.binding'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.assertion.signature'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.authnstatement'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.client.signature'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.encrypt'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.force.post.binding'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.multivalued.roles'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.onetimeuse.condition'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.server.signature'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','saml.server.signature.keyinfo.ext'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','false','tls.client.certificate.bound.access.tokens'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','true','use.refresh.tokens'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','backchannel.logout.revoke.offline.tokens'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','true','backchannel.logout.session.required'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','client_credentials.use_refresh_token'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','display.on.consent.screen'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','exclude.session.state.from.auth.response'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','id.token.as.detached.signature'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','oauth2.device.authorization.grant.enabled'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','oidc.ciba.grant.enabled'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','require.pushed.authorization.requests'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml_force_name_id_format'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.artifact.binding'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.assertion.signature'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.authnstatement'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.client.signature'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.encrypt'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.force.post.binding'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.multivalued.roles'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.onetimeuse.condition'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.server.signature'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','saml.server.signature.keyinfo.ext'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','false','tls.client.certificate.bound.access.tokens'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','true','use.refresh.tokens'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','backchannel.logout.revoke.offline.tokens'),('793d1977-08f0-4766-8c19-50f970b4b0e6','true','backchannel.logout.session.required'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','client_credentials.use_refresh_token'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','display.on.consent.screen'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','exclude.session.state.from.auth.response'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','id.token.as.detached.signature'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','oauth2.device.authorization.grant.enabled'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','oidc.ciba.grant.enabled'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','require.pushed.authorization.requests'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml_force_name_id_format'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.artifact.binding'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.assertion.signature'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.authnstatement'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.client.signature'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.encrypt'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.force.post.binding'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.multivalued.roles'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.onetimeuse.condition'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.server.signature'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','saml.server.signature.keyinfo.ext'),('793d1977-08f0-4766-8c19-50f970b4b0e6','false','tls.client.certificate.bound.access.tokens'),('793d1977-08f0-4766-8c19-50f970b4b0e6','true','use.refresh.tokens'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','backchannel.logout.revoke.offline.tokens'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','true','backchannel.logout.session.required'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','client_credentials.use_refresh_token'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','display.on.consent.screen'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','exclude.session.state.from.auth.response'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','id.token.as.detached.signature'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','oauth2.device.authorization.grant.enabled'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','oidc.ciba.grant.enabled'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','require.pushed.authorization.requests'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml_force_name_id_format'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.artifact.binding'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.assertion.signature'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.authnstatement'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.client.signature'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.encrypt'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.force.post.binding'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.multivalued.roles'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.onetimeuse.condition'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.server.signature'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','saml.server.signature.keyinfo.ext'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','false','tls.client.certificate.bound.access.tokens'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','true','use.refresh.tokens'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','backchannel.logout.revoke.offline.tokens'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','true','backchannel.logout.session.required'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','client_credentials.use_refresh_token'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','display.on.consent.screen'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','exclude.session.state.from.auth.response'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','id.token.as.detached.signature'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','oauth2.device.authorization.grant.enabled'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','oidc.ciba.grant.enabled'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','require.pushed.authorization.requests'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml_force_name_id_format'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.artifact.binding'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.assertion.signature'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.authnstatement'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.client.signature'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.encrypt'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.force.post.binding'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.multivalued.roles'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.onetimeuse.condition'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.server.signature'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','saml.server.signature.keyinfo.ext'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','false','tls.client.certificate.bound.access.tokens'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','true','use.refresh.tokens'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','backchannel.logout.revoke.offline.tokens'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','true','backchannel.logout.session.required'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','client_credentials.use_refresh_token'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','display.on.consent.screen'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','exclude.session.state.from.auth.response'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','id.token.as.detached.signature'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','oauth2.device.authorization.grant.enabled'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','oidc.ciba.grant.enabled'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','require.pushed.authorization.requests'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml_force_name_id_format'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.artifact.binding'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.assertion.signature'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.authnstatement'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.client.signature'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.encrypt'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.force.post.binding'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.multivalued.roles'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.onetimeuse.condition'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.server.signature'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','saml.server.signature.keyinfo.ext'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','false','tls.client.certificate.bound.access.tokens'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','true','use.refresh.tokens'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','backchannel.logout.revoke.offline.tokens'),('9036c717-132d-401e-9a4c-a9d810fd20ea','true','backchannel.logout.session.required'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','client_credentials.use_refresh_token'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','display.on.consent.screen'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','exclude.session.state.from.auth.response'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','id.token.as.detached.signature'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','oauth2.device.authorization.grant.enabled'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','oidc.ciba.grant.enabled'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','require.pushed.authorization.requests'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml_force_name_id_format'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.artifact.binding'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.assertion.signature'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.authnstatement'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.client.signature'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.encrypt'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.force.post.binding'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.multivalued.roles'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.onetimeuse.condition'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.server.signature'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','saml.server.signature.keyinfo.ext'),('9036c717-132d-401e-9a4c-a9d810fd20ea','false','tls.client.certificate.bound.access.tokens'),('9036c717-132d-401e-9a4c-a9d810fd20ea','true','use.refresh.tokens'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','backchannel.logout.revoke.offline.tokens'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','true','backchannel.logout.session.required'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','client_credentials.use_refresh_token'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','display.on.consent.screen'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','exclude.session.state.from.auth.response'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','id.token.as.detached.signature'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','oauth2.device.authorization.grant.enabled'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','oidc.ciba.grant.enabled'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','require.pushed.authorization.requests'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml_force_name_id_format'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.artifact.binding'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.assertion.signature'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.authnstatement'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.client.signature'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.encrypt'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.force.post.binding'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.multivalued.roles'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.onetimeuse.condition'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.server.signature'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','saml.server.signature.keyinfo.ext'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','false','tls.client.certificate.bound.access.tokens'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','true','use.refresh.tokens'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','backchannel.logout.revoke.offline.tokens'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','true','backchannel.logout.session.required'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','client_credentials.use_refresh_token'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','display.on.consent.screen'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','exclude.session.state.from.auth.response'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','id.token.as.detached.signature'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','oauth2.device.authorization.grant.enabled'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','oidc.ciba.grant.enabled'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','require.pushed.authorization.requests'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml_force_name_id_format'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.artifact.binding'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.assertion.signature'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.authnstatement'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.client.signature'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.encrypt'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.force.post.binding'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.multivalued.roles'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.onetimeuse.condition'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.server.signature'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','saml.server.signature.keyinfo.ext'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','false','tls.client.certificate.bound.access.tokens'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','true','use.refresh.tokens'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','backchannel.logout.revoke.offline.tokens'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','true','backchannel.logout.session.required'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','client_credentials.use_refresh_token'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','display.on.consent.screen'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','exclude.session.state.from.auth.response'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','id.token.as.detached.signature'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','oauth2.device.authorization.grant.enabled'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','oidc.ciba.grant.enabled'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','require.pushed.authorization.requests'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml_force_name_id_format'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.artifact.binding'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.assertion.signature'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.authnstatement'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.client.signature'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.encrypt'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.force.post.binding'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.multivalued.roles'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.onetimeuse.condition'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.server.signature'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','saml.server.signature.keyinfo.ext'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','false','tls.client.certificate.bound.access.tokens'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','true','use.refresh.tokens'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','backchannel.logout.revoke.offline.tokens'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','true','backchannel.logout.session.required'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','client_credentials.use_refresh_token'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','display.on.consent.screen'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','exclude.session.state.from.auth.response'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','id.token.as.detached.signature'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','oauth2.device.authorization.grant.enabled'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','oidc.ciba.grant.enabled'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','require.pushed.authorization.requests'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml_force_name_id_format'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.artifact.binding'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.assertion.signature'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.authnstatement'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.client.signature'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.encrypt'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.force.post.binding'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.multivalued.roles'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.onetimeuse.condition'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.server.signature'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','saml.server.signature.keyinfo.ext'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','false','tls.client.certificate.bound.access.tokens'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','true','use.refresh.tokens'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','backchannel.logout.revoke.offline.tokens'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','true','backchannel.logout.session.required'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','client_credentials.use_refresh_token'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','display.on.consent.screen'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','exclude.session.state.from.auth.response'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','id.token.as.detached.signature'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','oauth2.device.authorization.grant.enabled'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','oidc.ciba.grant.enabled'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','require.pushed.authorization.requests'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml_force_name_id_format'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.artifact.binding'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.assertion.signature'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.authnstatement'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.client.signature'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.encrypt'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.force.post.binding'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.multivalued.roles'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.onetimeuse.condition'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.server.signature'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','saml.server.signature.keyinfo.ext'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','false','tls.client.certificate.bound.access.tokens'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','true','use.refresh.tokens'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','backchannel.logout.revoke.offline.tokens'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','true','backchannel.logout.session.required'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','client_credentials.use_refresh_token'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','display.on.consent.screen'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','exclude.session.state.from.auth.response'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','id.token.as.detached.signature'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','oauth2.device.authorization.grant.enabled'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','oidc.ciba.grant.enabled'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','require.pushed.authorization.requests'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml_force_name_id_format'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.artifact.binding'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.assertion.signature'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.authnstatement'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.client.signature'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.encrypt'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.force.post.binding'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.multivalued.roles'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.onetimeuse.condition'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.server.signature'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','saml.server.signature.keyinfo.ext'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','false','tls.client.certificate.bound.access.tokens'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','true','use.refresh.tokens'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','backchannel.logout.revoke.offline.tokens'),('c1becbf8-bb52-474d-b54e-375b985048e4','true','backchannel.logout.session.required'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','client_credentials.use_refresh_token'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','display.on.consent.screen'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','exclude.session.state.from.auth.response'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','id.token.as.detached.signature'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','oauth2.device.authorization.grant.enabled'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','oidc.ciba.grant.enabled'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','require.pushed.authorization.requests'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml_force_name_id_format'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.artifact.binding'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.assertion.signature'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.authnstatement'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.client.signature'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.encrypt'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.force.post.binding'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.multivalued.roles'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.onetimeuse.condition'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.server.signature'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','saml.server.signature.keyinfo.ext'),('c1becbf8-bb52-474d-b54e-375b985048e4','false','tls.client.certificate.bound.access.tokens'),('c1becbf8-bb52-474d-b54e-375b985048e4','true','use.refresh.tokens'),('cac04663-a452-4803-baa4-e677f0ab16e0','S256','pkce.code.challenge.method'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','S256','pkce.code.challenge.method'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','backchannel.logout.revoke.offline.tokens'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','true','backchannel.logout.session.required'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','client_credentials.use_refresh_token'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','display.on.consent.screen'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','exclude.session.state.from.auth.response'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','id.token.as.detached.signature'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','oauth2.device.authorization.grant.enabled'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','oidc.ciba.grant.enabled'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','require.pushed.authorization.requests'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml_force_name_id_format'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.artifact.binding'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.assertion.signature'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.authnstatement'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.client.signature'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.encrypt'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.force.post.binding'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.multivalued.roles'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.onetimeuse.condition'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.server.signature'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','saml.server.signature.keyinfo.ext'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','false','tls.client.certificate.bound.access.tokens'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','true','use.refresh.tokens'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','S256','pkce.code.challenge.method'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','backchannel.logout.revoke.offline.tokens'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','true','backchannel.logout.session.required'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','client_credentials.use_refresh_token'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','display.on.consent.screen'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','exclude.session.state.from.auth.response'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','id.token.as.detached.signature'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','oauth2.device.authorization.grant.enabled'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','oidc.ciba.grant.enabled'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','require.pushed.authorization.requests'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml_force_name_id_format'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.artifact.binding'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.assertion.signature'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.authnstatement'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.client.signature'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.encrypt'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.force.post.binding'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.multivalued.roles'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.onetimeuse.condition'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.server.signature'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','saml.server.signature.keyinfo.ext'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','false','tls.client.certificate.bound.access.tokens'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','true','use.refresh.tokens'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','S256','pkce.code.challenge.method'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','backchannel.logout.revoke.offline.tokens'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','true','backchannel.logout.session.required'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','client_credentials.use_refresh_token'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','display.on.consent.screen'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','exclude.session.state.from.auth.response'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','id.token.as.detached.signature'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','oauth2.device.authorization.grant.enabled'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','oidc.ciba.grant.enabled'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','require.pushed.authorization.requests'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml_force_name_id_format'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.artifact.binding'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.assertion.signature'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.authnstatement'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.client.signature'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.encrypt'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.force.post.binding'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.multivalued.roles'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.onetimeuse.condition'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.server.signature'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','saml.server.signature.keyinfo.ext'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','false','tls.client.certificate.bound.access.tokens'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','true','use.refresh.tokens');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('00f78bef-b18d-4471-86e4-92d046c435c7','phone','ilan','OpenID Connect built-in scope: phone','openid-connect'),('3b6d4793-a50b-4e53-9c59-28070d3ed53a','address','ilan','OpenID Connect built-in scope: address','openid-connect'),('3dc2a519-2ed4-43a4-8f90-8d256e646f33','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('4281e214-3c52-4d23-8245-f5bf460a4c60','profile','ilan','OpenID Connect built-in scope: profile','openid-connect'),('52172e66-02ec-4ec9-a335-f712252e6558','email','ilan','OpenID Connect built-in scope: email','openid-connect'),('66aec351-f83e-442c-9d77-be504ad49a04','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('904dbfab-9775-4298-a441-70251d7e7b94','microprofile-jwt','ilan','Microprofile - JWT built-in scope','openid-connect'),('93487a71-c45d-4fbe-8179-0047b04e18ed','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('9bc79d01-3a01-43ce-821e-261107306d0d','role_list','master','SAML role list','saml'),('a8dacce7-da09-4093-b258-a2e77ab12417','web-origins','ilan','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('b4add9ba-2dc9-4ff2-a6ee-2171e5f06144','offline_access','ilan','OpenID Connect built-in scope: offline_access','openid-connect'),('b54310a6-7c4a-42b8-a142-3ab91ac3347e','email','master','OpenID Connect built-in scope: email','openid-connect'),('cdd8b18d-730d-4969-b7f0-554be85b99bd','role_list','ilan','SAML role list','saml'),('d096da82-34cd-4614-8b13-3606f2f15683','address','master','OpenID Connect built-in scope: address','openid-connect'),('db376032-05a4-4936-bcdc-9b43dbb2c6bb','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('db6efcfb-248c-4619-b992-a43f84bc1c0d','roles','ilan','OpenID Connect scope for add user roles to the access token','openid-connect'),('ed4cd313-9dd4-4c4a-a54a-b628d930582c','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('f7ca580d-b469-417d-8f23-bac2138714e1','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('00f78bef-b18d-4471-86e4-92d046c435c7','${phoneScopeConsentText}','consent.screen.text'),('00f78bef-b18d-4471-86e4-92d046c435c7','true','display.on.consent.screen'),('00f78bef-b18d-4471-86e4-92d046c435c7','true','include.in.token.scope'),('3b6d4793-a50b-4e53-9c59-28070d3ed53a','${addressScopeConsentText}','consent.screen.text'),('3b6d4793-a50b-4e53-9c59-28070d3ed53a','true','display.on.consent.screen'),('3b6d4793-a50b-4e53-9c59-28070d3ed53a','true','include.in.token.scope'),('3dc2a519-2ed4-43a4-8f90-8d256e646f33','${offlineAccessScopeConsentText}','consent.screen.text'),('3dc2a519-2ed4-43a4-8f90-8d256e646f33','true','display.on.consent.screen'),('4281e214-3c52-4d23-8245-f5bf460a4c60','${profileScopeConsentText}','consent.screen.text'),('4281e214-3c52-4d23-8245-f5bf460a4c60','true','display.on.consent.screen'),('4281e214-3c52-4d23-8245-f5bf460a4c60','true','include.in.token.scope'),('52172e66-02ec-4ec9-a335-f712252e6558','${emailScopeConsentText}','consent.screen.text'),('52172e66-02ec-4ec9-a335-f712252e6558','true','display.on.consent.screen'),('52172e66-02ec-4ec9-a335-f712252e6558','true','include.in.token.scope'),('66aec351-f83e-442c-9d77-be504ad49a04','${phoneScopeConsentText}','consent.screen.text'),('66aec351-f83e-442c-9d77-be504ad49a04','true','display.on.consent.screen'),('66aec351-f83e-442c-9d77-be504ad49a04','true','include.in.token.scope'),('904dbfab-9775-4298-a441-70251d7e7b94','false','display.on.consent.screen'),('904dbfab-9775-4298-a441-70251d7e7b94','true','include.in.token.scope'),('93487a71-c45d-4fbe-8179-0047b04e18ed','','consent.screen.text'),('93487a71-c45d-4fbe-8179-0047b04e18ed','false','display.on.consent.screen'),('93487a71-c45d-4fbe-8179-0047b04e18ed','false','include.in.token.scope'),('9bc79d01-3a01-43ce-821e-261107306d0d','${samlRoleListScopeConsentText}','consent.screen.text'),('9bc79d01-3a01-43ce-821e-261107306d0d','true','display.on.consent.screen'),('a8dacce7-da09-4093-b258-a2e77ab12417','','consent.screen.text'),('a8dacce7-da09-4093-b258-a2e77ab12417','false','display.on.consent.screen'),('a8dacce7-da09-4093-b258-a2e77ab12417','false','include.in.token.scope'),('b4add9ba-2dc9-4ff2-a6ee-2171e5f06144','${offlineAccessScopeConsentText}','consent.screen.text'),('b4add9ba-2dc9-4ff2-a6ee-2171e5f06144','true','display.on.consent.screen'),('b54310a6-7c4a-42b8-a142-3ab91ac3347e','${emailScopeConsentText}','consent.screen.text'),('b54310a6-7c4a-42b8-a142-3ab91ac3347e','true','display.on.consent.screen'),('b54310a6-7c4a-42b8-a142-3ab91ac3347e','true','include.in.token.scope'),('cdd8b18d-730d-4969-b7f0-554be85b99bd','${samlRoleListScopeConsentText}','consent.screen.text'),('cdd8b18d-730d-4969-b7f0-554be85b99bd','true','display.on.consent.screen'),('d096da82-34cd-4614-8b13-3606f2f15683','${addressScopeConsentText}','consent.screen.text'),('d096da82-34cd-4614-8b13-3606f2f15683','true','display.on.consent.screen'),('d096da82-34cd-4614-8b13-3606f2f15683','true','include.in.token.scope'),('db376032-05a4-4936-bcdc-9b43dbb2c6bb','${profileScopeConsentText}','consent.screen.text'),('db376032-05a4-4936-bcdc-9b43dbb2c6bb','true','display.on.consent.screen'),('db376032-05a4-4936-bcdc-9b43dbb2c6bb','true','include.in.token.scope'),('db6efcfb-248c-4619-b992-a43f84bc1c0d','${rolesScopeConsentText}','consent.screen.text'),('db6efcfb-248c-4619-b992-a43f84bc1c0d','true','display.on.consent.screen'),('db6efcfb-248c-4619-b992-a43f84bc1c0d','false','include.in.token.scope'),('ed4cd313-9dd4-4c4a-a54a-b628d930582c','false','display.on.consent.screen'),('ed4cd313-9dd4-4c4a-a54a-b628d930582c','true','include.in.token.scope'),('f7ca580d-b469-417d-8f23-bac2138714e1','${rolesScopeConsentText}','consent.screen.text'),('f7ca580d-b469-417d-8f23-bac2138714e1','true','display.on.consent.screen'),('f7ca580d-b469-417d-8f23-bac2138714e1','false','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('022d79a4-c939-4955-8b37-03e37198ad42','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('022d79a4-c939-4955-8b37-03e37198ad42','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('022d79a4-c939-4955-8b37-03e37198ad42','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('022d79a4-c939-4955-8b37-03e37198ad42','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('022d79a4-c939-4955-8b37-03e37198ad42','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('022d79a4-c939-4955-8b37-03e37198ad42','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('022d79a4-c939-4955-8b37-03e37198ad42','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('022d79a4-c939-4955-8b37-03e37198ad42','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('104510da-ddd8-4e94-af02-c1ede7bbeb46','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('104510da-ddd8-4e94-af02-c1ede7bbeb46','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('104510da-ddd8-4e94-af02-c1ede7bbeb46','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('104510da-ddd8-4e94-af02-c1ede7bbeb46','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('104510da-ddd8-4e94-af02-c1ede7bbeb46','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('104510da-ddd8-4e94-af02-c1ede7bbeb46','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('104510da-ddd8-4e94-af02-c1ede7bbeb46','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('104510da-ddd8-4e94-af02-c1ede7bbeb46','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('10afe5fe-3015-4fa4-8691-3d2c44256427','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('10afe5fe-3015-4fa4-8691-3d2c44256427','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('10afe5fe-3015-4fa4-8691-3d2c44256427','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('10afe5fe-3015-4fa4-8691-3d2c44256427','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('10afe5fe-3015-4fa4-8691-3d2c44256427','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('10afe5fe-3015-4fa4-8691-3d2c44256427','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('10afe5fe-3015-4fa4-8691-3d2c44256427','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('10afe5fe-3015-4fa4-8691-3d2c44256427','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('1f372198-46d2-4260-b7d2-97ae1559984f','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('1f372198-46d2-4260-b7d2-97ae1559984f','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('1f372198-46d2-4260-b7d2-97ae1559984f','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('1f372198-46d2-4260-b7d2-97ae1559984f','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('1f372198-46d2-4260-b7d2-97ae1559984f','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('1f372198-46d2-4260-b7d2-97ae1559984f','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('1f372198-46d2-4260-b7d2-97ae1559984f','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('1f372198-46d2-4260-b7d2-97ae1559984f','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('1ffe0269-47db-40b4-a10f-d8ed839032b8','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('1ffe0269-47db-40b4-a10f-d8ed839032b8','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('1ffe0269-47db-40b4-a10f-d8ed839032b8','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('1ffe0269-47db-40b4-a10f-d8ed839032b8','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('3061d99f-7724-4bfc-af02-66ff054dd130','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('3061d99f-7724-4bfc-af02-66ff054dd130','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('3061d99f-7724-4bfc-af02-66ff054dd130','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('3061d99f-7724-4bfc-af02-66ff054dd130','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('3061d99f-7724-4bfc-af02-66ff054dd130','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('3061d99f-7724-4bfc-af02-66ff054dd130','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('3061d99f-7724-4bfc-af02-66ff054dd130','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('3061d99f-7724-4bfc-af02-66ff054dd130','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('3233bbe5-5b78-4de0-aecc-3f84f311c029','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('3233bbe5-5b78-4de0-aecc-3f84f311c029','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('3233bbe5-5b78-4de0-aecc-3f84f311c029','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('3233bbe5-5b78-4de0-aecc-3f84f311c029','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('3e619479-33ad-4782-8094-85f0b163c457','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('3e619479-33ad-4782-8094-85f0b163c457','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('3e619479-33ad-4782-8094-85f0b163c457','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('3e619479-33ad-4782-8094-85f0b163c457','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('3e619479-33ad-4782-8094-85f0b163c457','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('3e619479-33ad-4782-8094-85f0b163c457','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('3e619479-33ad-4782-8094-85f0b163c457','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('3e619479-33ad-4782-8094-85f0b163c457','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('3ee78251-694a-40a4-811a-4d7a2b16d739','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('3ee78251-694a-40a4-811a-4d7a2b16d739','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('3ee78251-694a-40a4-811a-4d7a2b16d739','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('3ee78251-694a-40a4-811a-4d7a2b16d739','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('3ee78251-694a-40a4-811a-4d7a2b16d739','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('3ee78251-694a-40a4-811a-4d7a2b16d739','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('3ee78251-694a-40a4-811a-4d7a2b16d739','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('3ee78251-694a-40a4-811a-4d7a2b16d739','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('3fa9a65d-c17b-47d3-b495-636f4fc4d6ea','f7ca580d-b469-417d-8f23-bac2138714e1',_binary ''),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('4000aaa4-7aba-49e4-9ed1-74dea9f2cfce','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','f7ca580d-b469-417d-8f23-bac2138714e1',_binary ''),('436c8e6b-958f-4053-8771-b8b221a0e1fd','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('436c8e6b-958f-4053-8771-b8b221a0e1fd','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('436c8e6b-958f-4053-8771-b8b221a0e1fd','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('436c8e6b-958f-4053-8771-b8b221a0e1fd','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('57968d8e-c609-4e96-9367-3e7c56c2420f','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('57968d8e-c609-4e96-9367-3e7c56c2420f','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('57968d8e-c609-4e96-9367-3e7c56c2420f','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('57968d8e-c609-4e96-9367-3e7c56c2420f','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('57968d8e-c609-4e96-9367-3e7c56c2420f','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('57968d8e-c609-4e96-9367-3e7c56c2420f','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('57968d8e-c609-4e96-9367-3e7c56c2420f','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('57968d8e-c609-4e96-9367-3e7c56c2420f','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('6de38ed4-e035-4404-9e67-ad075ee3b788','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('6de38ed4-e035-4404-9e67-ad075ee3b788','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('6de38ed4-e035-4404-9e67-ad075ee3b788','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('6de38ed4-e035-4404-9e67-ad075ee3b788','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('6de38ed4-e035-4404-9e67-ad075ee3b788','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('6de38ed4-e035-4404-9e67-ad075ee3b788','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('6de38ed4-e035-4404-9e67-ad075ee3b788','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('6de38ed4-e035-4404-9e67-ad075ee3b788','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('793d1977-08f0-4766-8c19-50f970b4b0e6','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('793d1977-08f0-4766-8c19-50f970b4b0e6','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('793d1977-08f0-4766-8c19-50f970b4b0e6','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('793d1977-08f0-4766-8c19-50f970b4b0e6','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('793d1977-08f0-4766-8c19-50f970b4b0e6','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('793d1977-08f0-4766-8c19-50f970b4b0e6','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('793d1977-08f0-4766-8c19-50f970b4b0e6','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('793d1977-08f0-4766-8c19-50f970b4b0e6','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('7a3a7598-71c8-484f-9d07-6805d8f362d4','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('7a3a7598-71c8-484f-9d07-6805d8f362d4','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('7a3a7598-71c8-484f-9d07-6805d8f362d4','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('7a3a7598-71c8-484f-9d07-6805d8f362d4','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('7f8dd358-c87f-4dc1-a158-dde7c259d737','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('7f8dd358-c87f-4dc1-a158-dde7c259d737','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('7f8dd358-c87f-4dc1-a158-dde7c259d737','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('7f8dd358-c87f-4dc1-a158-dde7c259d737','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a','f7ca580d-b469-417d-8f23-bac2138714e1',_binary ''),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('9036c717-132d-401e-9a4c-a9d810fd20ea','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('9036c717-132d-401e-9a4c-a9d810fd20ea','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('9036c717-132d-401e-9a4c-a9d810fd20ea','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('9036c717-132d-401e-9a4c-a9d810fd20ea','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('9036c717-132d-401e-9a4c-a9d810fd20ea','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('9036c717-132d-401e-9a4c-a9d810fd20ea','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('9036c717-132d-401e-9a4c-a9d810fd20ea','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('9036c717-132d-401e-9a4c-a9d810fd20ea','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('b0053e68-6374-4d95-8f5d-fdd03f59f512','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('b0053e68-6374-4d95-8f5d-fdd03f59f512','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('b0053e68-6374-4d95-8f5d-fdd03f59f512','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('b0053e68-6374-4d95-8f5d-fdd03f59f512','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('c1becbf8-bb52-474d-b54e-375b985048e4','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('c1becbf8-bb52-474d-b54e-375b985048e4','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('c1becbf8-bb52-474d-b54e-375b985048e4','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('c1becbf8-bb52-474d-b54e-375b985048e4','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('c1becbf8-bb52-474d-b54e-375b985048e4','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('c1becbf8-bb52-474d-b54e-375b985048e4','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('c1becbf8-bb52-474d-b54e-375b985048e4','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('c1becbf8-bb52-474d-b54e-375b985048e4','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('cac04663-a452-4803-baa4-e677f0ab16e0','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('cac04663-a452-4803-baa4-e677f0ab16e0','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('cac04663-a452-4803-baa4-e677f0ab16e0','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('cac04663-a452-4803-baa4-e677f0ab16e0','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('cac04663-a452-4803-baa4-e677f0ab16e0','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('cac04663-a452-4803-baa4-e677f0ab16e0','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('cac04663-a452-4803-baa4-e677f0ab16e0','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('cac04663-a452-4803-baa4-e677f0ab16e0','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','f7ca580d-b469-417d-8f23-bac2138714e1',_binary ''),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('e93ce65c-04c8-4b1e-a2a8-6e705386bdfa','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','f7ca580d-b469-417d-8f23-bac2138714e1',_binary ''),('fc3586aa-ec51-4500-ae15-902b9d10cefe','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('fc3586aa-ec51-4500-ae15-902b9d10cefe','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('fc3586aa-ec51-4500-ae15-902b9d10cefe','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('fc3586aa-ec51-4500-ae15-902b9d10cefe','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('fc401ffd-dad4-45df-923a-1186c09ef560','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('fc401ffd-dad4-45df-923a-1186c09ef560','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('fc401ffd-dad4-45df-923a-1186c09ef560','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('fc401ffd-dad4-45df-923a-1186c09ef560','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('fc401ffd-dad4-45df-923a-1186c09ef560','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('fc401ffd-dad4-45df-923a-1186c09ef560','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('fc401ffd-dad4-45df-923a-1186c09ef560','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('fc401ffd-dad4-45df-923a-1186c09ef560','f7ca580d-b469-417d-8f23-bac2138714e1',_binary '');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('3dc2a519-2ed4-43a4-8f90-8d256e646f33','38c01890-8655-4ff5-a7d8-d5edbdb7647d'),('b4add9ba-2dc9-4ff2-a6ee-2171e5f06144','7bc17dbd-aa05-4ba7-b8db-e9525c820ef4');
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
INSERT INTO `COMPONENT` VALUES ('0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','rsa-enc-generated','ilan','rsa-enc-generated','org.keycloak.keys.KeyProvider','ilan',NULL),('11a8a3f8-b276-474c-83cf-a754908f808e','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('1edc256b-3173-427d-b3b2-427ae4033750','Allowed Protocol Mapper Types','ilan','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','authenticated'),('2c145c07-d95f-4458-a21e-6351ad83fc77','Max Clients Limit','ilan','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('53f9f148-2217-4d10-99ed-7bfc356b3dc9','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('59b2d880-2929-43ed-8ac5-30f60ebda299','aes-generated','ilan','aes-generated','org.keycloak.keys.KeyProvider','ilan',NULL),('5c5fec93-3e04-4ede-9b4d-4a8500141c2f','Consent Required','ilan','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('6c4fcd3b-1707-487b-97f3-e4ac93f26773','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('731b632d-88f9-48d8-ade7-f3a155a9e310','Full Scope Disabled','ilan','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('7648cb24-9aff-4d82-95d3-6dd456976ac9','rsa-generated','ilan','rsa-generated','org.keycloak.keys.KeyProvider','ilan',NULL),('78485a69-aabe-4894-a894-1e08b2fe10a7','Trusted Hosts','ilan','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('8db007a8-5e2a-43ae-aba5-0a717dc00d3f','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('9a0eaf73-c495-43de-9ab6-bd8510fffff6','Allowed Client Scopes','ilan','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('9f481bbe-8da8-4490-b92f-b8c03607eaf0','hmac-generated','ilan','hmac-generated','org.keycloak.keys.KeyProvider','ilan',NULL),('ad967299-9700-4714-b292-520bdb3b27b0','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('b340d79b-789b-433d-8a25-0c278d2b2201','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('cf3b48bd-c18c-4fb1-acac-1bdb2779548c','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d0157a51-568c-48ea-bd75-dcd76daa053a','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('d1cf0895-c451-4b26-b8db-873695bca11f','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('d471fd0a-266a-436f-8329-b7349f575958','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d6194d4e-3a1a-4960-9d03-e6642b1c5e2a','Allowed Client Scopes','ilan','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','authenticated'),('dc55ad6e-ecbd-4984-a31c-39efa14f16a9','Allowed Protocol Mapper Types','ilan','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ilan','anonymous'),('ecd59e43-1868-4376-a062-2fd997b736e7','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('f93e1980-8219-4edd-8ecb-0a6d75ddf012','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('0383f24b-f1c1-4646-b0b3-4106d28469c7','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','saml-role-list-mapper'),('0a40a1d7-b663-4822-8a9c-aff88e15e6a2','59b2d880-2929-43ed-8ac5-30f60ebda299','priority','100'),('0b500f02-a02c-4eda-9735-06a9b0b87e1b','8db007a8-5e2a-43ae-aba5-0a717dc00d3f','algorithm','RSA-OAEP'),('11769f7d-de00-4cc1-a574-105251ea718e','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','saml-role-list-mapper'),('12b62f1b-39fa-45bc-9fc7-62809c8c7245','78485a69-aabe-4894-a894-1e08b2fe10a7','client-uris-must-match','true'),('13d106a7-a3bc-46cf-aafd-c41e9cddcaf9','0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','priority','100'),('150b1bfd-170c-4260-b874-045792a17874','0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','certificate','MIIClzCCAX8CBgGNnRehbjANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpbGFuMB4XDTI0MDIxMjExMzEyOFoXDTM0MDIxMjExMzMwOFowDzENMAsGA1UEAwwEaWxhbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMX/JIl7Dk1euZo3lBk4cEh+6p1BYKmdXAMiz6Zthlngaz4vR1+n8xpO6VqD7eSgUlByvWcHF/rihVtorYNQIQHbxS7W0Xtu1+FH00OyT6Az7p6ZnNKtrTEomF8RIBA7vNhjPjJv3sqryRY5tRoP+YBYFPHzWCy/t7zc69PXBbZVeKX2JRivSiNFWZe2Hl8wgDqIhiUzF9pOTqtyxvaEBv/RQB4x+dtJlO4V9+aiHXX1T8ZlHoqDXDP1SKydiRmNYqAOtvee6NlVozmaNwJG+qJKDrU6YZIlnIj4pikMGDxCC+jS3T3BeoFyrdFrMrdys4U5q+wTusznqkaa81LreQ8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAjaQ7Q8s32lhm21J6yH5Xg6VnV7u98eH8N8k+QMN8+gFpZ9w3JfvQSCfadXY0gp2P0B0M1diA7ZpLfEAQLFbj1QXDjBpVeuBz51/QyNIDPg3WLPoD+lfvAgafCAOtB0BxcWB8/uj46hHxgiF2s5TMtmVvwLzduq2LWz9Mvqo83+OuBTZcqcYVZKWKmUNNwXdehhaotaDOCJcmMenlb1eEGzOqEdmvjE81fRNtxuSYSd5WYY0CgnHwInRUViaCKY0+N78oPRTqHtjPqPSca9ZV40FdLAyoTL2K3PRIGkIBrU+4j5+idEP/EkLwACsvHZHKpgeiX/S0cwl0872wUbMT1w=='),('16407bfc-f3c8-4b57-9f8c-70acb8b16fa5','b340d79b-789b-433d-8a25-0c278d2b2201','privateKey','MIIEpAIBAAKCAQEAi0jMy/0S5ZYIt7w1KM6poIhJrCLSvSpSiFQd/C4wRnRqC7Y9n7D5FQFc9O/cyWq9E79uPrtXbSzPWGVY7o3lOq/0OPNbPW5b9iphzmSWTdVRAQ6xRC7ySnFoiErGRoLw0s27BIUSEdB8dZLhLDqo/MnKBkQ+R2nA/paP5zHxabgJyJLgIAj9hlColiAQDcBy27lVyIq0WW6q+aGM7jGRg+yEeUpEqL7dLbSaq3CDJgWAxIN6HGJkJGtcbhU3P3eQLFn9x5NNaExEakTXfN6lTZ+mt10wrKnP3DINLKwpsQdBh2k8wRHuKsIRhTwYB9jk2+QTx8y/sf2WTD62C/BpEQIDAQABAoIBAA8twdPBIpwOe6i6Q/jMfMPX1l+B9AFVaWUd9Z6T0gL7kMrx80lB2gMmAOFYenEgxrYuOG9xrxdguL/jW4uzvvVkU3MZYioRqsfq2nnJkG+u/YLl/P93NkRSk5e2vmDUyDXQ4b6eWdfDJq0RcqSFSAE0ZGXGbhsONVAJTGlfkfV5RUE/DIvv3VGLO6bUjdPPBFBim+rs/FXcnjoS/g0xIZHnei3rCqdF/9qoQtVfXC2+iFn6m6wJMp0c3aDSc5F/Ry7LGi6H5tBlQRmSNZkiUob6GP/F/EtqzFjsZRIOPTuyo4VGuLXk4LEfqivSTpbevKybQ830eDazngJYsXLBKAECgYEA3GtAv+Ab6j2Bh51KHUflaKYjWDo2JjEdXaShCbX04NdEuJKFr+E4Isas8barmv9eW2IZ1ijajHxTMQXNzjj1fm2eIpuhOpyGGh8jkJfvIDoMXaGI+crNcUEEwV0bueIUaBlozCfeOvVcODnXjkAXzmj8svXHLkzq1g8nTSDmNlECgYEAocSvVB3uUhrWQTrIKRmOwkFhpZxZUDArTc8dnRe4QQSmyjPcbthHK+8E4ePX/fn3JacgrIflFgO7KbKwWS8gC++LJQYpp9NxO3gafwzMHiggqAFvIYpcjqXCn6uZ7NXoMhyOBnos8LekrF053mb/sCw4li9HXz4UqTpXlBgulsECgYB82tgTmBvX5L0xl3w699XQIIPW3yp7GckbmTyLJqGuluHbd0v446eLs2SVirbMFqlZNEmUURHzEB2DoFkC3qrY0bkIu4VpkO45b7gSmK2gYKFOjEjtzd3vsDfEXDxvX8vVZ8dAFblBRmjVhJZAgre5eSjjKmuII5PGa1EE1ITy8QKBgQCQ6rf+bQnQd8Y0jUo+t2ySTSwCxnukQGKqw75NurAPXvFj9u2kRxALJYaELi6SkVl8W6oDpYHuJM2IX1Fns7XLu341Xr32YI7xrXhfFMHOyjfnCdHahC7Cg3BExd+QsVfffIEnAFA+HOXim2l5+V9ZHWRb9mLDycOMjn1iZ/9kgQKBgQCi2KEACWrjOp/qFk3bKDV/GOCKpE4fjyYJd8HinnMcWIL+Nh8ZHbvjHlFKhL5uQv0F90Ql1H0j8iuYKcjQ9q+fl/AWOD1xCcT4bPSjlBqcbe3Guvs2rw4eVNCW6H61Hk7g1BY7IHF7RCdfmtROIT9JuFc8QLAcPkVgfgL40YEptw=='),('19fa95dc-c66d-4bf2-9c97-9e82057617b1','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1cac44bc-6996-41b0-b451-d17c5b4229ac','59b2d880-2929-43ed-8ac5-30f60ebda299','kid','247f06c7-99ef-4f1f-84d6-c52ed1d7cada'),('2083c7cf-aeff-4334-88ff-f0f1ae47426c','f93e1980-8219-4edd-8ecb-0a6d75ddf012','allow-default-scopes','true'),('29e93286-df25-4c8e-bf9d-0d984cf2a29a','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','saml-user-property-mapper'),('29f0b8e8-f28f-47e1-b70a-02e872a5c2c2','9f481bbe-8da8-4490-b92f-b8c03607eaf0','kid','a5505d05-7c15-4ac8-8a4c-eb79eac6c06d'),('2fd3a0c4-faba-4f62-a1ac-fb6b565f931d','78485a69-aabe-4894-a894-1e08b2fe10a7','host-sending-registration-request-must-match','true'),('31c02ad6-bc8c-42cd-ab45-12fe605d6117','8db007a8-5e2a-43ae-aba5-0a717dc00d3f','priority','100'),('35a9fb01-2eea-4e86-8416-c428abaa1ab1','0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','algorithm','RSA-OAEP'),('37573b05-29a2-4a4d-b07a-9fe957e28f23','0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','keyUse','ENC'),('38a90cb6-6649-4add-b06b-c37a275369f8','9f481bbe-8da8-4490-b92f-b8c03607eaf0','algorithm','HS256'),('3963295f-6710-4852-931a-f3d5df48967f','9a0eaf73-c495-43de-9ab6-bd8510fffff6','allow-default-scopes','true'),('3b5696d8-aac5-4345-9864-4273f40019c8','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','saml-user-property-mapper'),('41adc88a-595d-4d44-a746-6caa6b7170ad','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4717083a-5528-4465-93fe-e43e1ed6075a','8db007a8-5e2a-43ae-aba5-0a717dc00d3f','certificate','MIICmzCCAYMCBgGNnLmiPjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjEyMDk0ODQ3WhcNMzQwMjEyMDk1MDI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCYYqKgqIu6wK3d9/lXPmv97XdLqgkDowqgIQNer5/cMBAtXeJ93BgIHDjF9/i2mtyFlb2DMvMjZu1auioNHg6XoUoF+rIu9rtkb1cW2C3DIvXtbT3bmhhh6RllRePpcbo6SWmY9VKv8GGAJytccUAn4t9a7N7VWsvvZ0tlg4hTUUoF3ChjZKA3hX2tCVNp9/GwmKBLusohbL2g6wTeRfKLpeT0AdjlV8SRo7nqHmbPfualQhCTAA/ANzvq38CUv9G0bRqnbyX4DDZOYfQC1h/cO56dBBlJhugNiZY3AM5OaY3Ps5xDiXj+mpPZLbRWAlEfBHxwbN1Nw4PD9A2gJa+VAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAEKINoWNuyLGtKjOhy83RBnmbyRw4OzLoCqSxe8w7axAqzBjMSiMtdz7NlBms9iV12N5JYUMKomf+C3iv2Syr2wYSCpXcuK+D8K4GWitEpuoHEqsl0dFHZiQftORJQBuNzLWUt8DXTBnmuB6ubi2QUBfECOVL3vFwS+mHrg12ltqlF5WwCoRIQ1Fcg4gKhbvHCmGZ8GUMGt4RcSL7NfhS62ygl2QHFlg/u+gkrtI5i2Aj0uIUGNr0ZExxFehwEclT4ypBMxEY9K4C6gX8Bg1nW8L+Gjz8ZHFIfZeIX6LABV8to6OJWgfuE0whPycEwg0H7IAPpH0HJkLMsymrVqK6Y='),('4b5127e3-e190-4e26-b6ca-d9c412b6463a','d1cf0895-c451-4b26-b8db-873695bca11f','secret','srFxBvKYBmdlUmnjm62sMQ'),('547adb13-e4b0-4d1e-b625-e547386ec496','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('55088ca1-a885-4b36-a70e-5724c0f88360','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('562646d7-0b7f-4f34-8d17-c69f5c6e71f6','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','oidc-address-mapper'),('5a1e8003-f7e7-430b-91d3-c98c21ebe6f4','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('62525481-1ac6-44cc-98e1-8ecf61eaf55a','2c145c07-d95f-4458-a21e-6351ad83fc77','max-clients','200'),('660364bd-daec-43b2-b98b-12286fb2603d','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','saml-role-list-mapper'),('6a0108b0-9bb0-4ffa-88cf-7ea1d8301578','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','saml-role-list-mapper'),('6c52fbb7-30f8-4f7c-8cd4-a80acdd4e165','ad967299-9700-4714-b292-520bdb3b27b0','secret','XkpIu2veSFnlxzbJm1WsyygXDtVKyrD15yKP_-Rt8TZOFUvZWXj6CaFwdFpg59KrtO4f1u5ze0E51vN_MejJLQ'),('6dda19fc-0098-4f46-bf3f-3e8696d3d0a5','9f481bbe-8da8-4490-b92f-b8c03607eaf0','secret','MU_2n6khv8ansef83HpOng5mW9rLBEjLE8ofwjJihyCthia-9Fd5TNtKU7UJ8o7b13Za89D4V8b9g5B0ilxtQA'),('6e5b078d-3ce3-4c52-a706-9fb182a4d82b','7648cb24-9aff-4d82-95d3-6dd456976ac9','privateKey','MIIEpAIBAAKCAQEA6MBbXTG0pCPfDwzDievKfrqhoiPPHFAruRxt932HcTvNfpFL1q/QgHRyYab6gHVGWHHOJi0sGHniktoDW86koY0n1fgpLME0xTdI3X0y9ZF/dskgxX0/mN6Tyl3yIOSCitAw9vfJ0Qye63YxNcHw/YfzHqS5XfNxIoDFYTYYTF6d5S7jHNbgy75qkwPfRGUK3TZpgSIId3ki5CinfaFP4Ucp8L8zxGjmOj8NeLktW6twjreh0T27KA49HgWfOTI98w+LuuU+MIrrz+qv4Dewk6XbEusxgkuvZ+oXOrD5roC+2RCUFfH+g6sA8Yc+k+M9cSP8HyJHjkHGfgz56Z3rNwIDAQABAoIBADoSxLkcDdZmnOFEbgWbr4qvRmUOSj7mQgKN9WIrEABQy5Uo66NFeuCSLXfwEdC7cjHfM3CTFM2Gm+HIQ85EYQ9uCOJ6aMuh6WjLwoKBGpXrF8KrrGGaPqQF5Ro5FpDeczPvfkggy1o9q+lUNDMVkOuxYBflQdsPQss5FgaLWMS03RKZdBX2E7p01FvaL11uALIJccm1X9+zFRF6QyLj5Z6LIFJ7dVFwdKdNoPaqymilTCfpRg+G88+xeOUGH+gudl9+ZKOsEMR/XwJQ7qBaOvrhoOamzNGu7EPT+ZVPp6le070OV2rZ3DfQupv25HqM2SKHXeZ3QcXTEp+hNHsDoQECgYEA+6QttwriA3gDwmesRyFQLlAIyNUGFViC6awP6ijD6r6hrPNFEO1yutN4HQz/jChMKK/sLGzzRbELVfH/M80FaSFl3sXyPEUOd23oeRJuPD8U21NyTV7I/zxEDQiwwtW2u2ny+tuAdbgo7ReAaGxnU6R90qgSPL1y7PG6hIDdof0CgYEA7MhqxiFT5hX5jFq1GgWQoe+2VboGQfIT9QPBPyEnaBpeXfeICpc/N43RVIybDZvUr121Ml+UDOgmVom5MRXIKEOPj13kqPzEimZElDdaz63LLbVVBFGqzG7GpNovWoaG7XSYBItU3i+ASUH0y1xRBZ0MWthsF+MEkp4MAb4KfkMCgYEA7tEYha/xYaNjxftIF9V42Asi2x64gEeZLpUaIXuAu+chXxcdA/yltsL9KmzsliKkbLTQ6jSYCBsHDBD3xzybFvQYTv0DcMmE+jk3uLeSIOEpNSGTx/Pdw8V5O/l0b+QNYP4jGIp69r3JMYHtXq0KvunMc8EIVdbiHBcpkZkPPi0CgYAffoTdN5+eMfwQVBxUirrzHxxEiMq+SMGozEgO6o0ARsmYfA0nQ3jQHdfjBBS3mauPa8pnGdlqYhJ/XjA4vCn0WRAmRJnedEh8FCA5CqfUicxFlyHowigSqwVW9gJoaw5VVTXHHPU73FuW4uP5jJzmPz5ecvzlrHd2PPlh3fItWwKBgQCgmZQUDm1hwViZJm/QmtJi0NKM+dJUmFJ4F3tGn5kNGB3siYoRw7CPBwFi+XpX+zHebSVhJ6qWkDcWeuTACs9MO+xBrtctlB8Ho95ggJzjgr+JtaMfSCFXJ8eDGwCjmn+rH0SDphQDFkzrgTMCYcDv2Wf+RRSrhvQA7b2vJb72ng=='),('6ef6babf-88d4-4ccc-9e28-cc6b2da7b23d','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6ff9eab6-2aa3-4192-935c-2cdeff5f9793','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','oidc-address-mapper'),('720f521e-70f6-4956-a24f-54525332d808','ecd59e43-1868-4376-a062-2fd997b736e7','host-sending-registration-request-must-match','true'),('7224af4e-8b6a-4455-89c7-75ee3700dd5b','7648cb24-9aff-4d82-95d3-6dd456976ac9','certificate','MIIClzCCAX8CBgGNnRegrTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpbGFuMB4XDTI0MDIxMjExMzEyN1oXDTM0MDIxMjExMzMwN1owDzENMAsGA1UEAwwEaWxhbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOjAW10xtKQj3w8Mw4nryn66oaIjzxxQK7kcbfd9h3E7zX6RS9av0IB0cmGm+oB1RlhxziYtLBh54pLaA1vOpKGNJ9X4KSzBNMU3SN19MvWRf3bJIMV9P5jek8pd8iDkgorQMPb3ydEMnut2MTXB8P2H8x6kuV3zcSKAxWE2GExeneUu4xzW4Mu+apMD30RlCt02aYEiCHd5IuQop32hT+FHKfC/M8Ro5jo/DXi5LVurcI63odE9uygOPR4FnzkyPfMPi7rlPjCK68/qr+A3sJOl2xLrMYJLr2fqFzqw+a6AvtkQlBXx/oOrAPGHPpPjPXEj/B8iR45Bxn4M+emd6zcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEALviVMsw8teJOVfNfi4g7dkvTeZ4uSavc3TLMqLUsplnlfsL2J9xFV19ZAQ/LAZ/IIcjJd7i/bhJFwvaj4l73X2zgSU12SoJz+OOFNg5V/Iq/BYlVCSwdH1bVLzOwgDMwD+6mjeiv1jd9Lo9OCPc5T4AWceUfXacOeLRLkPcsaPUbLiwHkS4miay/zQcoGkFd6QS1ryGHN8T3gY2ZYrBnLbU2anyeHj00eMp3OO1TaoJHd86FwOGn7AuPyaJHfjAzTrDOas123/FRoxRPa7/feZuxK6wznNATRDdPerGZQInf3nhHMxH+SldgZj4dsShNtC3pJ8qBe5B4AukhXNpdlw=='),('79df5259-aaa6-406a-92e7-37e228d3b6a9','b340d79b-789b-433d-8a25-0c278d2b2201','certificate','MIICmzCCAYMCBgGNnLmhzjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjEyMDk0ODQ3WhcNMzQwMjEyMDk1MDI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCLSMzL/RLllgi3vDUozqmgiEmsItK9KlKIVB38LjBGdGoLtj2fsPkVAVz079zJar0Tv24+u1dtLM9YZVjujeU6r/Q481s9blv2KmHOZJZN1VEBDrFELvJKcWiISsZGgvDSzbsEhRIR0Hx1kuEsOqj8ycoGRD5HacD+lo/nMfFpuAnIkuAgCP2GUKiWIBANwHLbuVXIirRZbqr5oYzuMZGD7IR5SkSovt0ttJqrcIMmBYDEg3ocYmQka1xuFTc/d5AsWf3Hk01oTERqRNd83qVNn6a3XTCsqc/cMg0srCmxB0GHaTzBEe4qwhGFPBgH2OTb5BPHzL+x/ZZMPrYL8GkRAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACzhnwRkEFDyZWr9zo9gdg6lyKj4osIulVMugVuazedn6fPgfWCXEHH93YUTtXft+yeE3xHbnYvZJeL6r036kMoCg1MUU9l2XepTCdfkaK3/WhitS3rCs5lLdBOTThdceaFhV4wzsni10+ofDwKoMWjCp6v5EPnOg9dJduTfxoJeTkNvdrOSP2Hri55sVBLF9PhUDGH+6ruaA+bPa2xHW5YTKIVe1w9wt45jOANt0Z+gaDlhBajuiBZ3LHTIYaYMXSsjVABK+ifdE05MFdeysbacasz50xQ252oxo7bUd+40hbtiW2N62gAo1H7X4IB4c9h0NekUIFLjYhzogChHqnE='),('7d42a12e-3dc3-46a4-8ad6-33ae0e003193','ad967299-9700-4714-b292-520bdb3b27b0','algorithm','HS256'),('84edaa1e-b8d4-48e7-85ba-5cb5223c7be3','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8823b7bb-39f1-48fa-955a-b24761516457','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','oidc-full-name-mapper'),('8d499fc6-3cc0-4c09-af26-296b39bd7ef2','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','oidc-address-mapper'),('8fd79ce9-5009-45d0-ac49-e27934bcc040','9f481bbe-8da8-4490-b92f-b8c03607eaf0','priority','100'),('95e042c9-0546-49c1-8857-3641163694bf','b340d79b-789b-433d-8a25-0c278d2b2201','keyUse','SIG'),('a0bf8d54-4f75-457a-a4aa-51e0b1347bab','d1cf0895-c451-4b26-b8db-873695bca11f','priority','100'),('a9b85b70-8108-41f6-93ed-7fd92f8c808a','8db007a8-5e2a-43ae-aba5-0a717dc00d3f','keyUse','ENC'),('ac08909e-b4d5-4751-a4a9-64347be4c55d','cf3b48bd-c18c-4fb1-acac-1bdb2779548c','max-clients','200'),('b28dcacf-f420-4f79-978b-acae8f23cd19','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b7bd5163-478e-48f4-84e4-2574aa445b9a','59b2d880-2929-43ed-8ac5-30f60ebda299','secret','Yxx1a1ZlAb4iuEE-asYqOQ'),('bd6ea645-8b80-47ae-80d0-494a53c80bb3','53f9f148-2217-4d10-99ed-7bfc356b3dc9','allow-default-scopes','true'),('bf39309a-2136-4c13-b4c6-6bbcdd57b44e','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','saml-user-property-mapper'),('c108a4f0-f722-4901-a774-bcc6af4b308b','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','saml-user-property-mapper'),('c15b3c0d-6b09-45f7-a895-81cc632d7734','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c2790462-d172-43e1-959b-8ef229ef766c','ad967299-9700-4714-b292-520bdb3b27b0','priority','100'),('c49f2806-e3be-4274-b916-9816137682f7','8db007a8-5e2a-43ae-aba5-0a717dc00d3f','privateKey','MIIEpAIBAAKCAQEAmGKioKiLusCt3ff5Vz5r/e13S6oJA6MKoCEDXq+f3DAQLV3ifdwYCBw4xff4tprchZW9gzLzI2btWroqDR4Ol6FKBfqyLva7ZG9XFtgtwyL17W0925oYYekZZUXj6XG6OklpmPVSr/BhgCcrXHFAJ+LfWuze1VrL72dLZYOIU1FKBdwoY2SgN4V9rQlTaffxsJigS7rKIWy9oOsE3kXyi6Xk9AHY5VfEkaO56h5mz37mpUIQkwAPwDc76t/AlL/RtG0ap28l+Aw2TmH0AtYf3DuenQQZSYboDYmWNwDOTmmNz7OcQ4l4/pqT2S20VgJRHwR8cGzdTcODw/QNoCWvlQIDAQABAoIBADE1ySbwxw7sIjnIVrEh62X5RckdhAO0pz3G63usY4eLze2YoAfdB7W2x27HAX6WzBgnnye7UGFiX8woymOqDTRSVcFQkDIyY5mviwRJk52ssJaX7J36SV11FUprI4rDu0wPYRaQQr+mdRYZkBsuR3WaAl8ul1d3FtydEvAZZfDhksO/dhYs6ygDU723+KiALg8gs10T3IRnNRz9uasG0Tst2uacHgot14QnOkSzxChNEnetqz8GMfKr/gYOmNRvHg2DNn85xPfGWLFUN8cOg++D1l88rmZ3hs5EAH75oDWBQTs+qEfN7S1ukOz8HeXiMK5bKrsTgDGv610USumPipECgYEA4WOOe4klqgKWhfevWADFwvC7D1FRbrzAbDcppPv51KNvrk9xomVcbt8tEvMrsxasfcBHy5yWah70jhbebvv1q7EVUQbUijUPgv8HBGcUnHzaDGmOlxO2ShadfDkccK434dAtA02z5U/QWiXYqb9BLwguSxdjFYoaNVZVqiu/tXsCgYEArRTZlGYWfx9S+vxh/C3qWYeDWSt7e1LSnq4Wcy4b+LlWs86GMIValRq/DcgWcow+zg5w64paihbDCJJjjUQeQh3XkdwELhrP/OfyjuXBehtOuhSmW1HatsONhpP0JhdlBcr7Zv+IZHe7ZC/ok+1P+vCdeTgoj7ig3/SQ47LIui8CgYEAqfQyWoDeP8ZXzokoVQmwFgEEbNZ6uy/lQTSPWHMQvgDHk/8fxr775javfFyVFSQByYkWGjjnSvowmnwwGiwv4dlUI5cs6VJ9cd/wYKeB6UZT/YwTE2SvzkojUqqWAXm9da9OYfFTt5RpnbBwIf+vnVFj5weplXJftNx3GCyJEMUCgYBAOc9vaN6KN5Z0Ojkl+efPZyDPcvo0TgyIA3OjNAX/Ks9Ik6dp0+JEGBOzSn9B7FbV4bf3P3TPbxjaUnAMmK1dvXMj1e/bJ+nsICn66rj71axGEqmUk3BEh5Y5zSc5B09ece8OTl5PYbqwt7JnShV2udjFhZhPlKRl1nv5cntX0wKBgQCKJFNDm+86zAh7AoubS17uIuKTcJ5+MOxCh6sPmSiIqtbhvOot8KdK1Zq5CLDR0lMLSm66zHj8wsvRLpakp0Mc9Y+Y8I77bhKA8TRIrzRiqnfndUr58I+80SJIPoZRbqzkxw8sdgngjxBHhvRLHwVPO+V+hh0alvO9+MUp/x7RNQ=='),('c7de9c52-9919-4864-9b27-7b81ce85d87b','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c945e0dd-b124-4a38-9f5c-8486d35d4847','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c99a085b-ffee-4a84-a104-6c56d80759ec','ecd59e43-1868-4376-a062-2fd997b736e7','client-uris-must-match','true'),('cc2e5c87-5784-4134-aa64-5e8c2e7b1606','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','oidc-address-mapper'),('cee1c2bd-f3e3-4def-a7cf-f624ffda8b51','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d0ac03fc-3899-45c9-9112-3a76c019ee96','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d22b26f6-caa3-494e-b4e1-129390df48be','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d6bbd31f-72c2-48e0-8754-7cfc1dbda0ff','7648cb24-9aff-4d82-95d3-6dd456976ac9','keyUse','SIG'),('e5c7807f-02d3-4e1a-b986-2c1e95bd1ce7','b340d79b-789b-433d-8a25-0c278d2b2201','priority','100'),('e5cfabf0-b74b-4155-9cd7-083d290b8397','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('e717825a-5534-41a5-8d37-b924b24ac151','7648cb24-9aff-4d82-95d3-6dd456976ac9','priority','100'),('edcc6e17-891f-4341-8da5-9c12d8708fac','d471fd0a-266a-436f-8329-b7349f575958','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('efd408e4-af64-4345-b4e9-68a23354eaad','ad967299-9700-4714-b292-520bdb3b27b0','kid','61c7c5cc-7222-4f71-af4e-a901f578f6d3'),('eff888df-b295-4f9f-b6d7-7824cd7f025a','0a3f8107-fbdb-4a7a-ba24-9332bf7e6fe8','privateKey','MIIEowIBAAKCAQEAxf8kiXsOTV65mjeUGThwSH7qnUFgqZ1cAyLPpm2GWeBrPi9HX6fzGk7pWoPt5KBSUHK9ZwcX+uKFW2itg1AhAdvFLtbRe27X4UfTQ7JPoDPunpmc0q2tMSiYXxEgEDu82GM+Mm/eyqvJFjm1Gg/5gFgU8fNYLL+3vNzr09cFtlV4pfYlGK9KI0VZl7YeXzCAOoiGJTMX2k5Oq3LG9oQG/9FAHjH520mU7hX35qIddfVPxmUeioNcM/VIrJ2JGY1ioA62957o2VWjOZo3Akb6okoOtTphkiWciPimKQwYPEIL6NLdPcF6gXKt0Wsyt3KzhTmr7BO6zOeqRprzUut5DwIDAQABAoIBAD/xRy5zJEpOVih83IJMnM581m4UyA/e9vE4U9FOu73Y4SmDAUzeI3+SjoAh7TkRoaPDenGEc/UdJK5Bnw+yWAaOoB6hV6PCR0vE83CAbICzZNOpjmDnn/ApSRQiprU3ZaSIYHTPdicD1XwtBNS25f/R8mm1Cfvhqof+3NZcMccRP+p2gZcXRaZU0FruHIydsAb4bDfphgFqtA99LJs9xP0cixtgUjouot/tKyZbzqvFwHek0xMaEwMMIXbci2tksEVbSdemzmpBHlszEWP3FZp+HH0BN+EIfMPkNmUYEQHAz+/aeGCPSATENEnVNgAZ3g3TLeCx9uvoVLV3ttlKB6kCgYEA4tXcFljG0ui4kU9Eu2WifhZWYFdYx1OwH5nYE0k/ngFIvCGECve/UseOA1m665sKEmlFH4h9x98w32J6PLonNhvNdZONBIfySzBtx1r91IkD9U5XfgP3r5r4PlrEJzH01uAg10UGbTnSwbgHt2pa+0UPtoo8pZcDA8IXVSX8q+UCgYEA33QTFwo2R2JKOZWFgfRc57qlSCnIAMgFf1HXISjj4r+YIM4t63jJkLQeqd3lCpkzAtp0VDWFuq8tzgVBFgQ47c0cbzu8YFTs8kLNn/yHVjIAF07YFsz8kQMJK9U33ZGadujnVlVWZhJj1NnuDI0wIF81x4SOVVqsHvqDGyVECeMCgYAleyrzslWgEf41XIDB6khQR0acgrJTtVtbzWLrxOWzKQkotO0JluhROFIZ8aC2P5cJdcWLMVV/SjzcHHyQPj4ubaekbu4VOpVpoSXyk/FvRfiWdwxz8RnjNVshioPw6gtH2h7zEx+9upk9kzgLMZK5BC9VfUAKKIrB+zc5xZ4blQKBgAMmg85jWniPLjS5ovQ+GcE6pHHsBOHd8BXndX0GMpBT2zU7MvKK9WyQ3Y3PjxcjKdD0e4dkacpEBgVNlalVzeesaKY41WMWT3Dq+DM1QEM62T164xkPMtBoloyDqRH6p47docVZ1qoBwF6T5ANRSkhqjzuM5uTVLnARYB/V2qu5AoGBAL1sL2FwunLkTBL1HZSAuyQEYk+NtSNqbBWKRNnvwYeSDOAipw5Wr6yU8HYp97mXZXzwIkx83t1DNQvp8llOujmnzXwZQRRI7icoJpwrilglesZwlqOaBjQ7kCzYUkvGDEDdZ//ucYAvbxYEG8SVl7pygJaHtxA9F33feGI3lXDZ'),('f4e415a4-9c54-4013-84fb-248292758752','dc55ad6e-ecbd-4984-a31c-39efa14f16a9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f8a42ffe-cc30-431c-9057-b167d4eaadfc','d1cf0895-c451-4b26-b8db-873695bca11f','kid','0ebaccb2-47bb-4bc2-b5c6-855cc18f2f1e'),('f8b248cf-67aa-45b5-aeaf-146f55e79ed2','d6194d4e-3a1a-4960-9d03-e6642b1c5e2a','allow-default-scopes','true'),('fc945610-e5c5-4218-ac05-abd8b96f420e','1edc256b-3173-427d-b3b2-427ae4033750','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ff36545d-165a-40ac-b92d-f18d182d0dcd','d0157a51-568c-48ea-bd75-dcd76daa053a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('088d9056-f583-45e7-9c5a-a1cf0ba40c92','d7a647a9-0db4-46ca-834b-b21fc14e5d2b'),('22991d03-8f98-40be-80f7-1838af1dd821','38c01890-8655-4ff5-a7d8-d5edbdb7647d'),('22991d03-8f98-40be-80f7-1838af1dd821','c0e4d566-4863-4e0d-9ad5-16cb011955e8'),('22991d03-8f98-40be-80f7-1838af1dd821','cf93f1cc-1d3b-4e76-8b12-40128669747a'),('22991d03-8f98-40be-80f7-1838af1dd821','f182e81f-3df2-4834-a5cb-baf9b4671c39'),('36ffd96e-87b8-49b0-aec6-fe52a167a707','48557f28-5e94-42e9-93b6-fe2ae6e169c1'),('458938bb-e39e-4dd1-b342-2772d41ebf9f','30272df8-686c-428f-8517-5c034b994436'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','0620ac26-1baf-41af-8a5b-0ac2cc1f4e23'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','0f934a99-1ea1-495c-9ebf-47b70f44ec0d'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','2413bd46-a755-4e85-bdc4-4e2b46157297'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','3ac1f7f9-0d25-4e7d-8e5c-d4be2d8a62a9'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','4099fa40-32b8-4767-aab5-714c65490b21'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','679d3065-375b-4531-ab64-5ee33dc30241'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','79a87729-78bd-40ec-a9ec-86a251b81a90'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','79b85a18-41cb-4f7f-9df6-769146566fad'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','85077bbf-5f4a-4bd9-ac14-42e132985fde'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','880f91f5-4ded-4c1f-9771-1480348a85ff'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','a8bacc3c-244b-46b8-8b51-5fa8ff9817be'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','abf6151a-ed63-484b-94a8-156e231477de'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','bb78046e-2d4a-4bec-a8c8-94b8a455c8c3'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','c47fb12f-1750-46ad-ab83-8fa409aca3aa'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','cf719258-a8ae-4e9d-bc3a-684a7ac2344e'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','f2d0cfae-4768-4e66-96aa-d3435e0e5d3b'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','f8afa434-f0ae-4c20-a58d-51130fc382d9'),('476993b0-2d02-49ab-a19c-0aca9628f7ec','fd171724-d4f5-4b12-9006-dda77a0fbeb8'),('5c840745-0b66-4088-8984-a135a695db6d','54f8784e-7a24-47f5-a591-80bcafea1e54'),('679d3065-375b-4531-ab64-5ee33dc30241','0f934a99-1ea1-495c-9ebf-47b70f44ec0d'),('679d3065-375b-4531-ab64-5ee33dc30241','79a87729-78bd-40ec-a9ec-86a251b81a90'),('6840f517-617e-462f-802f-995e24cffc18','4a92eed1-807b-4333-8592-d86838ffec95'),('6840f517-617e-462f-802f-995e24cffc18','c6682b08-ce7c-4a90-866b-1dcf494386c9'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','088d9056-f583-45e7-9c5a-a1cf0ba40c92'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','0b40be8f-c5a5-430f-928e-18e559b2a39c'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','14ec1e83-502e-426d-81b2-6c6444f22c56'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','1ae99ebc-122d-45d7-a95f-314ad41e6009'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','2493bdb1-7f6b-4a91-9386-745db422e61c'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','2d3db1f4-4d2f-457f-b0b7-46e77f605551'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','2e65b02b-1fad-4a53-9abf-e0bc89cd81d9'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','3ffbbb40-71e4-405a-b626-d075893822ff'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','4a92eed1-807b-4333-8592-d86838ffec95'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','4e739502-e730-4418-8b21-f34eb5b557e6'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','51ebbd9c-39ae-44e5-8026-622b4a8a1741'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','5968ba02-9b6f-4199-9cf9-6ae9b1efd4bb'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','5c645751-1d4a-4a8a-a17c-c6f402baa775'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','6653fb35-e6d9-403c-8d12-fb79c7a4eb81'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','6837a8e8-6a45-4526-b292-a9c09deddcef'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','6840f517-617e-462f-802f-995e24cffc18'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','817d3f07-d7d2-4cc8-af85-7ebe2ebb4f5f'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','907c2627-1707-4321-a288-93c5e32171da'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','9334496a-43ef-44b2-881e-639ed46e0518'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','937f46d2-bd96-453c-b929-1521f112e51e'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','94f6a1dd-91ae-4d97-a019-d324c940af96'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','a1ee9af2-ef48-4556-951a-bc202ab99358'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','ae096d2a-b7a3-493e-9425-0ccd0f346e95'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','b79b794f-250d-461b-9e8f-ec7c2fa7ba19'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','c46ddf8b-d978-46e6-b01c-2819d2119c21'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','c6682b08-ce7c-4a90-866b-1dcf494386c9'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','c7007e58-9914-4508-925c-0922912514a2'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','cda20caf-9f68-42c3-84e1-09a349c45857'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','d7a647a9-0db4-46ca-834b-b21fc14e5d2b'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','e062d4b9-cb88-4f3e-b1cf-6d0019550429'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','e4c5d130-75de-4154-8b33-e2e248064f88'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','eb1c16a2-fc86-432e-9948-54949a98d435'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','ecf050d8-107f-475e-8096-0040ec2574fe'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','f0f1a814-0a3e-4da5-9839-d4778220fb34'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','f39dd7e4-7ae9-4cf9-b8c2-a6cf392ba94e'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','fd6533c9-111d-4f01-87ed-0f00e728276e'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','fedeb2e0-ef2c-46be-8943-5ec3eec55e30'),('9334496a-43ef-44b2-881e-639ed46e0518','5968ba02-9b6f-4199-9cf9-6ae9b1efd4bb'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','0256f712-783d-48b4-8a92-0f59cce2abc3'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','0df1386d-cf05-4e87-b133-cdcfae429bda'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','5c840745-0b66-4088-8984-a135a695db6d'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','7bc17dbd-aa05-4ba7-b8db-e9525c820ef4'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','a096b720-46d2-4ead-9b3e-b10785f223eb'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','b9c0561a-095c-42ad-841e-7e6d1d13f1cb'),('f182e81f-3df2-4834-a5cb-baf9b4671c39','7dd7e13f-1828-41db-bcfc-d20b12c31c8f'),('f2d0cfae-4768-4e66-96aa-d3435e0e5d3b','f8afa434-f0ae-4c20-a58d-51130fc382d9'),('fedeb2e0-ef2c-46be-8943-5ec3eec55e30','2493bdb1-7f6b-4a91-9386-745db422e61c'),('fedeb2e0-ef2c-46be-8943-5ec3eec55e30','937f46d2-bd96-453c-b929-1521f112e51e');
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
INSERT INTO `CREDENTIAL` VALUES ('3796b8c1-7c67-4eab-ac9b-f2ef055570fa',NULL,'password','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe',1707731428325,NULL,'{\"value\":\"wOCs7kwRlnf3oGHh3BZlVGpOzW+eF2kWZPKoQIWVmm9jt+8LldhXAnw/nKc0eUeYIlGAkrgvDfVgzdu/VerAKg==\",\"salt\":\"3CzNkSYDwqvwGUQanXwi3Q==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('ddae0486-9a3c-453c-bb95-7af0c0712a32',NULL,'password','9ef8fc0c-6a28-4303-bf3d-268b4e81fba7',1707738113666,NULL,'{\"value\":\"DeRJpZEIeM5udz0F1KgHJMv9rMEiKZoV23qvbi0+CmyjnXWBfZFRTf/cjQHRZ/e0/3kpaYqBjh3d1vI2xOvMyw==\",\"salt\":\"poEe/wVImAFZCY2nha7siQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-02-12 09:49:48',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-02-12 09:49:48',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-02-12 09:49:49',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-02-12 09:49:49',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-02-12 09:49:51',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-02-12 09:49:51',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-02-12 09:49:54',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-02-12 09:49:54',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-02-12 09:49:54',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-02-12 09:49:56',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-02-12 09:49:57',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-02-12 09:49:57',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-02-12 09:49:57',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-12 09:49:58',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-12 09:49:58',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-12 09:49:58',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-12 09:49:58',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-02-12 09:49:59',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-02-12 09:50:01',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-02-12 09:50:01',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-02-12 09:50:01',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-02-12 09:50:01',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-02-12 09:50:01',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-02-12 09:50:01',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-02-12 09:50:01',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-02-12 09:50:01',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-02-12 09:50:03',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-02-12 09:50:03',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-02-12 09:50:05',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-02-12 09:50:05',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-02-12 09:50:06',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-02-12 09:50:06',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-12 09:50:06',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-12 09:50:06',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-12 09:50:08',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-02-12 09:50:08',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-12 09:50:08',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7731383656'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-02-12 09:50:08',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-02-12 09:50:08',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-12 09:50:08',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-12 09:50:08',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-02-12 09:50:08',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-12 09:50:10',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-02-12 09:50:10',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-12 09:50:10',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-12 09:50:10',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-12 09:50:10',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-12 09:50:12',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-12 09:50:12',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-02-12 09:50:14',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-02-12 09:50:14',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-02-12 09:50:14',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-02-12 09:50:14',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-02-12 09:50:14',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-12 09:50:14',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-12 09:50:14',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-12 09:50:15',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-12 09:50:18',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-02-12 09:50:19',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-02-12 09:50:19',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-02-12 09:50:19',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-02-12 09:50:19',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-02-12 09:50:19',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-02-12 09:50:19',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-02-12 09:50:19',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-02-12 09:50:19',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-02-12 09:50:19',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-02-12 09:50:19',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-02-12 09:50:20',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-02-12 09:50:20',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7731383656'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-02-12 09:50:20',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'7731383656'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-12 09:50:20',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-12 09:50:20',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-12 09:50:20',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-12 09:50:21',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-12 09:50:21',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-12 09:50:21',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-12 09:50:21',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-12 09:50:22',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-12 09:50:22',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-12 09:50:23',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-12 09:50:23',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-12 09:50:23',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-12 09:50:23',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7731383656'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-12 09:50:23',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7731383656'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-02-12 09:50:23',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'7731383656'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-02-12 09:50:23',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-02-12 09:50:23',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'7731383656'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'7731383656'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7731383656'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7731383656'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:23',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'7731383656'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-12 09:50:24',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7731383656'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7731383656'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7731383656'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7731383656'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-12 09:50:24',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'7731383656'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-02-12 09:50:24',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'7731383656');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('ilan','00f78bef-b18d-4471-86e4-92d046c435c7',_binary '\0'),('ilan','3b6d4793-a50b-4e53-9c59-28070d3ed53a',_binary '\0'),('ilan','4281e214-3c52-4d23-8245-f5bf460a4c60',_binary ''),('ilan','52172e66-02ec-4ec9-a335-f712252e6558',_binary ''),('ilan','904dbfab-9775-4298-a441-70251d7e7b94',_binary '\0'),('ilan','a8dacce7-da09-4093-b258-a2e77ab12417',_binary ''),('ilan','b4add9ba-2dc9-4ff2-a6ee-2171e5f06144',_binary '\0'),('ilan','cdd8b18d-730d-4969-b7f0-554be85b99bd',_binary ''),('ilan','db6efcfb-248c-4619-b992-a43f84bc1c0d',_binary ''),('master','3dc2a519-2ed4-43a4-8f90-8d256e646f33',_binary '\0'),('master','66aec351-f83e-442c-9d77-be504ad49a04',_binary '\0'),('master','93487a71-c45d-4fbe-8179-0047b04e18ed',_binary ''),('master','9bc79d01-3a01-43ce-821e-261107306d0d',_binary ''),('master','b54310a6-7c4a-42b8-a142-3ab91ac3347e',_binary ''),('master','d096da82-34cd-4614-8b13-3606f2f15683',_binary '\0'),('master','db376032-05a4-4936-bcdc-9b43dbb2c6bb',_binary ''),('master','ed4cd313-9dd4-4c4a-a54a-b628d930582c',_binary '\0'),('master','f7ca580d-b469-417d-8f23-bac2138714e1',_binary '');
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
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('7867491e-2107-42de-8c6b-7f74cdbabd0a','0069ac5f-7195-470c-a7fe-6581b8e61384'),('ef012f0c-cd2d-44db-93e5-05ba09905796','0069ac5f-7195-470c-a7fe-6581b8e61384'),('1edd06a4-9dfa-4b7f-ab4f-52a744dad478','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('279d3346-036f-41d1-ad48-c26d355693d6','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('2fb2c529-38b2-4429-ba50-9e60d1f75827','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('49eba3ad-972e-468a-b880-d1660c3d4644','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('533f19c0-7141-4066-9397-c5c77b8f53f9','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('55b58fbf-e185-4ba2-b18b-280290aed14a','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('586937ff-b0b3-427d-9c8a-1e98c845d472','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('75efc06b-57c4-4df6-9d9c-b7462aaf63ec','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('7849a0e7-6244-41a4-8fcc-a2c93da87448','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('7b1e114c-93b5-45b5-a1cd-b179e288ad40','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('8e4469f9-e846-41dd-9f8a-4ba596885d66','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('9b168d47-9090-4b78-9ce8-abf02f4a7dea','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('aba2f581-2dcb-4cd4-a693-f22e4382ca42','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('ba3fb59f-2971-43de-acf6-401dd2f6c2b7','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('c00d9eab-03d5-4e49-8271-112f85a27350','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('d24d6be8-723f-4ec2-89e5-8884a251fb55','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('d5261bc1-30b1-4ec5-8f92-c7b7342b6974','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('d5617b51-55cb-4bb4-af40-9eed648ebddd','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('dc5996ce-5fb0-404b-8295-ffaa7ce4798f','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('f2a1cc79-9c41-43ef-a29e-773beeff6b1c','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('ffcc0a34-b426-45bf-9b44-06686802417e','176957be-62c1-4fc4-bbbd-90cf49f6075b'),('1ed2370d-78e8-4cbe-b7c5-4181449fdc7e','21f6508d-b5d3-4119-85bc-46b22b8fbde8'),('221be554-ba37-4c18-8a38-120ed2a079c7','21f6508d-b5d3-4119-85bc-46b22b8fbde8'),('4fb5be07-d219-4c62-bbf7-f9907e2fee12','21f6508d-b5d3-4119-85bc-46b22b8fbde8'),('34f64b8b-c0b6-4285-9a28-c2fb6d3dc262','23a99d23-2390-4297-926f-57acc52e9c45'),('85595b65-79bf-4883-8e8a-0e2adb4abc0f','23a99d23-2390-4297-926f-57acc52e9c45'),('b23ca1ac-ed16-4ab1-a407-aea535cbd58b','23a99d23-2390-4297-926f-57acc52e9c45'),('be500f6e-1a88-47be-afaf-577e3504666d','23a99d23-2390-4297-926f-57acc52e9c45'),('15ced5f0-6d4d-4ac9-84cb-0cf3e4297a60','324e1cd4-8122-4dca-b711-2b685ea0a6f5'),('ba3fb59f-2971-43de-acf6-401dd2f6c2b7','324e1cd4-8122-4dca-b711-2b685ea0a6f5'),('d5617b51-55cb-4bb4-af40-9eed648ebddd','324e1cd4-8122-4dca-b711-2b685ea0a6f5'),('5169827c-5cd1-470a-b503-d17b384ce552','52ef67ec-6a98-4874-b389-b94dd0bdb986'),('7e2743b1-a05d-40d9-a208-535889b12b78','52ef67ec-6a98-4874-b389-b94dd0bdb986'),('93342626-bd5a-4ec0-8fef-fb07a4f2119b','52ef67ec-6a98-4874-b389-b94dd0bdb986'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','52ef67ec-6a98-4874-b389-b94dd0bdb986'),('ed9f9d9c-a3a6-4e32-bf58-ca795436dc91','52ef67ec-6a98-4874-b389-b94dd0bdb986'),('2a007376-3e83-464f-b5d3-859fd762e3c8','66673bc7-be1a-484d-bb27-f257a7ddc4e3'),('692456da-a21b-44c8-8949-0ffce913d17d','66673bc7-be1a-484d-bb27-f257a7ddc4e3'),('85595b65-79bf-4883-8e8a-0e2adb4abc0f','66673bc7-be1a-484d-bb27-f257a7ddc4e3'),('88758635-2c63-41b6-8d7f-deb14041acb0','66673bc7-be1a-484d-bb27-f257a7ddc4e3'),('9ce85ba6-d00b-4486-9937-80db305f4400','66673bc7-be1a-484d-bb27-f257a7ddc4e3'),('64985732-3b19-41a4-945d-743fbd622818','750be113-0928-498d-baa0-daaccabb2155'),('a320e7be-5baa-41a1-934d-b9b9725634dd','750be113-0928-498d-baa0-daaccabb2155'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','750be113-0928-498d-baa0-daaccabb2155'),('e7f1f6f3-1711-4c6e-b39b-920fdd6b1632','750be113-0928-498d-baa0-daaccabb2155'),('42adef16-c0d0-4a09-90a3-30413fb23e9d','75e46d4f-b3f4-41dd-bd15-f5bfcbb06274'),('f24ac29c-f679-4192-bb11-87ce84efee78','75e46d4f-b3f4-41dd-bd15-f5bfcbb06274'),('7ca7f69d-f3c1-413c-b836-39c90eb2768f','7eb9f728-e75e-4695-ae86-a33c73962a29'),('7f8d8645-e001-4abe-8ff4-b48b347967b8','7eb9f728-e75e-4695-ae86-a33c73962a29'),('081884e7-f567-465f-a2a7-95ace0195846','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('18133a9d-1634-41c4-ab59-e5ef79b087ed','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('1ed2370d-78e8-4cbe-b7c5-4181449fdc7e','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('221be554-ba37-4c18-8a38-120ed2a079c7','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('487c465a-afcd-4f52-ba60-236f29774bb2','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('5955d34c-5aca-4914-b06c-a90b79b35d3a','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('65574087-699c-4049-8c9f-438e2e6961a0','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('7464dad9-0477-4229-b240-49aa9fb5f999','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('7b1e114c-93b5-45b5-a1cd-b179e288ad40','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('7baf29f0-7865-44d8-8934-60e0410839a1','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('a4270bf8-cf3f-4ec7-90c6-43890ac9c809','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('ad7bb4d8-5e8e-4f69-8c3a-015d1cd9de98','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('b78727a8-e1c0-4d69-a9b5-2b4108782369','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('bb18a7cb-4abf-4b80-a928-43fa0c6e47fb','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('bffac7b9-bafc-4468-b619-f33d2157fba0','8ca50a93-89c9-4206-a970-bfbb35adc5d6'),('18133a9d-1634-41c4-ab59-e5ef79b087ed','a30eb443-3fff-4f65-8e48-e05c4b34cd51'),('a4270bf8-cf3f-4ec7-90c6-43890ac9c809','a30eb443-3fff-4f65-8e48-e05c4b34cd51'),('75efc06b-57c4-4df6-9d9c-b7462aaf63ec','a468d01d-5f82-469f-837f-a51ac2c90706'),('d24d6be8-723f-4ec2-89e5-8884a251fb55','a468d01d-5f82-469f-837f-a51ac2c90706'),('487c465a-afcd-4f52-ba60-236f29774bb2','a7ba4b45-6133-4d8a-87f2-b1d1d2a2e1cd'),('5111036d-ff06-4536-ae97-c3186454a807','a7ba4b45-6133-4d8a-87f2-b1d1d2a2e1cd'),('b78727a8-e1c0-4d69-a9b5-2b4108782369','a7ba4b45-6133-4d8a-87f2-b1d1d2a2e1cd'),('82efcde7-18f5-4a2b-b69a-ab900fabd5d5','b1bfbdfc-ad4c-48e7-9f5c-8fbad5489ab1'),('e53aecaa-cbfa-4834-b291-6d4fa2ecf10d','b1bfbdfc-ad4c-48e7-9f5c-8fbad5489ab1'),('07dfb768-642c-495b-b7e0-0360a9b93255','b399ddc5-827b-4d38-8890-8d70f40428fe'),('081884e7-f567-465f-a2a7-95ace0195846','b399ddc5-827b-4d38-8890-8d70f40428fe'),('18133a9d-1634-41c4-ab59-e5ef79b087ed','b399ddc5-827b-4d38-8890-8d70f40428fe'),('1ed2370d-78e8-4cbe-b7c5-4181449fdc7e','b399ddc5-827b-4d38-8890-8d70f40428fe'),('221be554-ba37-4c18-8a38-120ed2a079c7','b399ddc5-827b-4d38-8890-8d70f40428fe'),('31c31ccf-6cb7-48d4-a944-8a012947f2f6','b399ddc5-827b-4d38-8890-8d70f40428fe'),('321cfc3d-b17e-4a8e-a62f-4eea9f8b901b','b399ddc5-827b-4d38-8890-8d70f40428fe'),('487c465a-afcd-4f52-ba60-236f29774bb2','b399ddc5-827b-4d38-8890-8d70f40428fe'),('4fb5be07-d219-4c62-bbf7-f9907e2fee12','b399ddc5-827b-4d38-8890-8d70f40428fe'),('50b788c5-9843-4cdb-97ab-3520ef359871','b399ddc5-827b-4d38-8890-8d70f40428fe'),('5111036d-ff06-4536-ae97-c3186454a807','b399ddc5-827b-4d38-8890-8d70f40428fe'),('65574087-699c-4049-8c9f-438e2e6961a0','b399ddc5-827b-4d38-8890-8d70f40428fe'),('7464dad9-0477-4229-b240-49aa9fb5f999','b399ddc5-827b-4d38-8890-8d70f40428fe'),('7867491e-2107-42de-8c6b-7f74cdbabd0a','b399ddc5-827b-4d38-8890-8d70f40428fe'),('7b1e114c-93b5-45b5-a1cd-b179e288ad40','b399ddc5-827b-4d38-8890-8d70f40428fe'),('7ca7f69d-f3c1-413c-b836-39c90eb2768f','b399ddc5-827b-4d38-8890-8d70f40428fe'),('7f8d8645-e001-4abe-8ff4-b48b347967b8','b399ddc5-827b-4d38-8890-8d70f40428fe'),('a4270bf8-cf3f-4ec7-90c6-43890ac9c809','b399ddc5-827b-4d38-8890-8d70f40428fe'),('ac0feacb-1cb2-498c-89c2-dc0816810673','b399ddc5-827b-4d38-8890-8d70f40428fe'),('b78727a8-e1c0-4d69-a9b5-2b4108782369','b399ddc5-827b-4d38-8890-8d70f40428fe'),('bb18a7cb-4abf-4b80-a928-43fa0c6e47fb','b399ddc5-827b-4d38-8890-8d70f40428fe'),('bffac7b9-bafc-4468-b619-f33d2157fba0','b399ddc5-827b-4d38-8890-8d70f40428fe'),('ef012f0c-cd2d-44db-93e5-05ba09905796','b399ddc5-827b-4d38-8890-8d70f40428fe'),('1f0013e6-04a7-40b3-9688-0c39f428e88d','b5c0101a-6a2b-4299-a97f-001d9a44a90f'),('b3308968-51cf-4acd-9f7b-1476f5b12ca7','b5c0101a-6a2b-4299-a97f-001d9a44a90f'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','b5c0101a-6a2b-4299-a97f-001d9a44a90f'),('16752d2c-bb01-4c93-839c-ef2e1ccf66c2','bf471e03-c61c-4259-bbaf-9ff97750de5c'),('586937ff-b0b3-427d-9c8a-1e98c845d472','bf471e03-c61c-4259-bbaf-9ff97750de5c'),('aba2f581-2dcb-4cd4-a693-f22e4382ca42','bf471e03-c61c-4259-bbaf-9ff97750de5c'),('d711fb22-4153-4bc3-89ed-dbb15380a495','bf471e03-c61c-4259-bbaf-9ff97750de5c'),('ffcc0a34-b426-45bf-9b44-06686802417e','bf471e03-c61c-4259-bbaf-9ff97750de5c'),('1edd06a4-9dfa-4b7f-ab4f-52a744dad478','d25af318-e85a-4d57-8016-73809dd64816'),('c00d9eab-03d5-4e49-8271-112f85a27350','d25af318-e85a-4d57-8016-73809dd64816'),('d711fb22-4153-4bc3-89ed-dbb15380a495','d25af318-e85a-4d57-8016-73809dd64816'),('ffcc0a34-b426-45bf-9b44-06686802417e','d25af318-e85a-4d57-8016-73809dd64816'),('081884e7-f567-465f-a2a7-95ace0195846','ed516e67-b624-4152-92c5-0b3137a9382f'),('5111036d-ff06-4536-ae97-c3186454a807','ed516e67-b624-4152-92c5-0b3137a9382f'),('85595b65-79bf-4883-8e8a-0e2adb4abc0f','ed516e67-b624-4152-92c5-0b3137a9382f'),('bffac7b9-bafc-4468-b619-f33d2157fba0','ed516e67-b624-4152-92c5-0b3137a9382f'),('15ced5f0-6d4d-4ac9-84cb-0cf3e4297a60','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('16752d2c-bb01-4c93-839c-ef2e1ccf66c2','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('18133a9d-1634-41c4-ab59-e5ef79b087ed','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('221be554-ba37-4c18-8a38-120ed2a079c7','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('279d3346-036f-41d1-ad48-c26d355693d6','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('42adef16-c0d0-4a09-90a3-30413fb23e9d','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('8e4469f9-e846-41dd-9f8a-4ba596885d66','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('b78727a8-e1c0-4d69-a9b5-2b4108782369','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('bffac7b9-bafc-4468-b619-f33d2157fba0','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('d711fb22-4153-4bc3-89ed-dbb15380a495','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('df9b1b14-dd95-48fc-b1cb-754a4289ba78','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('f24ac29c-f679-4192-bb11-87ce84efee78','f0904bbb-f744-4ac6-bbe3-542c0bda561c'),('91892d13-834a-491d-91e5-e738a5013eed','fe4cf003-e743-461c-a7a1-31335ac30477'),('a5d7b3e1-34bc-4ea0-9571-7df38cbc366c','fe4cf003-e743-461c-a7a1-31335ac30477'),('d5dc076e-899f-4b19-850c-8e9a1cea1a35','fe4cf003-e743-461c-a7a1-31335ac30477'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','fe4cf003-e743-461c-a7a1-31335ac30477');
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
INSERT INTO `KEYCLOAK_GROUP` VALUES ('fb566f80-07e2-43ff-aa72-38076d3f27f0','F1Domain',' ','ilan'),('805ed296-6d27-4702-a248-625724abc270','F5Domain',' ','ilan'),('43c6e398-6867-4530-ad61-9bfe2806033b','PortalDomain',' ','ilan'),('8afafb84-2cf9-4323-a76b-80e11b6b55c9','Smartsight','43c6e398-6867-4530-ad61-9bfe2806033b','ilan'),('b399ddc5-827b-4d38-8890-8d70f40428fe','Admin','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('a7ba4b45-6133-4d8a-87f2-b1d1d2a2e1cd','Archivio','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('7eb9f728-e75e-4695-ae86-a33c73962a29','EntryDocManagement','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('21f6508d-b5d3-4119-85bc-46b22b8fbde8','IngressoMerci','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('ed516e67-b624-4152-92c5-0b3137a9382f','Lavorazione','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('a30eb443-3fff-4f65-8e48-e05c4b34cd51','UscitaMerci','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('0069ac5f-7195-470c-a7fe-6581b8e61384','ViewDashboard','6251748c-d1b7-472e-b7a9-b41fa9f2e616','ilan'),('d7b9deba-3e4b-4f2a-a63c-ce5161da54ec','OP','805ed296-6d27-4702-a248-625724abc270','ilan'),('176957be-62c1-4fc4-bbbd-90cf49f6075b','ServerAdmin','805ed296-6d27-4702-a248-625724abc270','ilan'),('b2281e77-556d-4eab-bbb2-41e9f72b672b','Smartsight','805ed296-6d27-4702-a248-625724abc270','ilan'),('66673bc7-be1a-484d-bb27-f257a7ddc4e3','OperatoreStazione1','874d4d31-04d6-4b4f-9ba4-364edf2c1627','ilan'),('23a99d23-2390-4297-926f-57acc52e9c45','OperatoreStazione6','874d4d31-04d6-4b4f-9ba4-364edf2c1627','ilan'),('f0904bbb-f744-4ac6-bbe3-542c0bda561c','Admin','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('d25af318-e85a-4d57-8016-73809dd64816','Archivio','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('b1bfbdfc-ad4c-48e7-9f5c-8fbad5489ab1','EntryDocManagement','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('324e1cd4-8122-4dca-b711-2b685ea0a6f5','IngressoMerci','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('bf471e03-c61c-4259-bbaf-9ff97750de5c','Lavorazione','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('a468d01d-5f82-469f-837f-a51ac2c90706','UscitaMerci','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('75e46d4f-b3f4-41dd-bd15-f5bfcbb06274','ViewDashboard','b2281e77-556d-4eab-bbb2-41e9f72b672b','ilan'),('52ef67ec-6a98-4874-b389-b94dd0bdb986','OperatoreStazione1','d7b9deba-3e4b-4f2a-a63c-ce5161da54ec','ilan'),('750be113-0928-498d-baa0-daaccabb2155','OperatoreStazione4','d7b9deba-3e4b-4f2a-a63c-ce5161da54ec','ilan'),('fe4cf003-e743-461c-a7a1-31335ac30477','OperatoreStazione5','d7b9deba-3e4b-4f2a-a63c-ce5161da54ec','ilan'),('b5c0101a-6a2b-4299-a97f-001d9a44a90f','OperatoreStazione6','d7b9deba-3e4b-4f2a-a63c-ce5161da54ec','ilan'),('874d4d31-04d6-4b4f-9ba4-364edf2c1627','OP','fb566f80-07e2-43ff-aa72-38076d3f27f0','ilan'),('8ca50a93-89c9-4206-a970-bfbb35adc5d6','ServerAdmin','fb566f80-07e2-43ff-aa72-38076d3f27f0','ilan'),('6251748c-d1b7-472e-b7a9-b41fa9f2e616','Smartsight','fb566f80-07e2-43ff-aa72-38076d3f27f0','ilan');
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0237057d-5af6-45ec-9312-066b3bd2c4c0','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Ruolo ad uso esclusivo per la manutenzione del SW smartsight','Debug','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('0256f712-783d-48b4-8a92-0f59cce2abc3','3233bbe5-5b78-4de0-aecc-3f84f311c029',_binary '',NULL,'gfproxyDefaultRole','ilan','3233bbe5-5b78-4de0-aecc-3f84f311c029',NULL),('0620ac26-1baf-41af-8a5b-0ac2cc1f4e23','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_impersonation}','impersonation','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('07dfb768-642c-495b-b7e0-0360a9b93255','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Permette l\'invio di un elemento di produzione nell\'\'insieme degli elementi di produzione attiva','SendToActive','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('081884e7-f567-465f-a2a7-95ace0195846','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Endpoint OData in sola lettura per elementi di produzione attivi','viewLavorazione','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('088d9056-f583-45e7-9c5a-a1cf0ba40c92','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-clients}','view-clients','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('094c5434-90cb-4465-8f9c-0fd77652d0d0','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_view-applications}','view-applications','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('0b40be8f-c5a5-430f-928e-18e559b2a39c','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-users}','manage-users','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('0df1386d-cf05-4e87-b133-cdcfae429bda','a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742',_binary '',NULL,'gfproxyDefaultRole','ilan','a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742',NULL),('0f934a99-1ea1-495c-9ebf-47b70f44ec0d','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_query-users}','query-users','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('11927643-0495-40aa-bf05-4b31466c3452','57968d8e-c609-4e96-9367-3e7c56c2420f',_binary '',NULL,'force_sequence','ilan','57968d8e-c609-4e96-9367-3e7c56c2420f',NULL),('14ec1e83-502e-426d-81b2-6c6444f22c56','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_impersonation}','impersonation','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('15ced5f0-6d4d-4ac9-84cb-0cf3e4297a60','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',_binary '','Permette la visualizzazione della bolla d\'ingresso corrente in lavorazione sulla stazione 1','NoteListViewer','ilan','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',NULL),('163e94d7-ed8e-4ff7-b03b-8fa30e36c337','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',_binary '','Permette la visualizzazione della bolla in compilazione','NoteListOutViewer','ilan','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',NULL),('16752d2c-bb01-4c93-839c-ef2e1ccf66c2','1f372198-46d2-4260-b7d2-97ae1559984f',_binary '','Permette di utilizzare l\'interfaccia REST per la lettura dei dati in memoria','reader','ilan','1f372198-46d2-4260-b7d2-97ae1559984f',NULL),('18133a9d-1634-41c4-ab59-e5ef79b087ed','b0053e68-6374-4d95-8f5d-fdd03f59f512',_binary '','Endpoint Odata in sola lettura per le bolle d\'uscita della linea di verniciatura','viewNoteListOut','ilan','b0053e68-6374-4d95-8f5d-fdd03f59f512',NULL),('1ae99ebc-122d-45d7-a95f-314ad41e6009','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-authorization}','manage-authorization','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('1ed2370d-78e8-4cbe-b7c5-4181449fdc7e','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Endpoint Odata in sola lettura per le bolle d\'ingresso della linea di verniciatura','viewNoteList','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('1edd06a4-9dfa-4b7f-ab4f-52a744dad478','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Endpoint Odata in sola lettura per elementi di produzione archiviati','viewArchivio','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('1f0013e6-04a7-40b3-9688-0c39f428e88d','c1becbf8-bb52-474d-b54e-375b985048e4',_binary '',NULL,'creator','ilan','c1becbf8-bb52-474d-b54e-375b985048e4',NULL),('221be554-ba37-4c18-8a38-120ed2a079c7','b0053e68-6374-4d95-8f5d-fdd03f59f512',_binary '','Endpoint Odata in sola lettura per le bolle d\'ingresso della linea di verniciatura','viewNoteList','ilan','b0053e68-6374-4d95-8f5d-fdd03f59f512',NULL),('22991d03-8f98-40be-80f7-1838af1dd821','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('2413bd46-a755-4e85-bdc4-4e2b46157297','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-users}','manage-users','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('2493bdb1-7f6b-4a91-9386-745db422e61c','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_query-users}','query-users','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('279d3346-036f-41d1-ad48-c26d355693d6','3ee78251-694a-40a4-811a-4d7a2b16d739',_binary '',NULL,'Viewer','ilan','3ee78251-694a-40a4-811a-4d7a2b16d739',NULL),('2a007376-3e83-464f-b5d3-859fd762e3c8','0cf6016a-3950-4267-8d6a-66c2dce33fc0',_binary '',NULL,'viewer','ilan','0cf6016a-3950-4267-8d6a-66c2dce33fc0',NULL),('2ab3901f-7725-41db-aa01-160f547e25b3','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Permette l\'invio di un elemento di produzione attiva nell\'archivio dei lavorati','SendToArchive','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('2c8b9cc2-0302-4b94-a520-5b3f8062db9a','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'impostazione della della ricetta da utilizzare per la lavorazione','ProductionSetRecipe','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('2d3db1f4-4d2f-457f-b0b7-46e77f605551','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_create-client}','create-client','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('2e65b02b-1fad-4a53-9abf-e0bc89cd81d9','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-events}','manage-events','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('2f87b14a-1856-459f-9403-0578e99972b5','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette la transazione per l\'inserimento di una bolla d\'uscita','NoteListOutTransaction','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('2fb2c529-38b2-4429-ba50-9e60d1f75827','436c8e6b-958f-4053-8771-b8b221a0e1fd',_binary '',NULL,'Debug','ilan','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL),('30272df8-686c-428f-8517-5c034b994436','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_view-consent}','view-consent','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('31c31ccf-6cb7-48d4-a944-8a012947f2f6','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Accesso alle funzioni di gestione manuale delle comunicazioni verso pms','PmsDocManagementFE','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('321cfc3d-b17e-4a8e-a62f-4eea9f8b901b','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'accesso alle funzioni di invio manuale verso il sistema PMS','PmsDocManagement','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('34f64b8b-c0b6-4285-9a28-c2fb6d3dc262','5b6b331f-965b-4709-a0db-f4cd8a4b6650',_binary '',NULL,'viewer','ilan','5b6b331f-965b-4709-a0db-f4cd8a4b6650',NULL),('3568f8a1-e347-47c7-97d3-cc495c5d7b6e','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'accesso alle funzioni di invio manuale verso il sistema PMS','PmsDocManagement','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('36ffd96e-87b8-49b0-aec6-fe52a167a707','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_manage-consent}','manage-consent','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('38c01890-8655-4ff5-a7d8-d5edbdb7647d','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('3ac1f7f9-0d25-4e7d-8e5c-d4be2d8a62a9','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-events}','manage-events','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('3dfd5d3c-74d1-42a4-bea8-cbd24dd379b6','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Accesso alle funzioni di gestione manuale delle comunicazioni verso pms','PmsDocManagementFE','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('3ffbbb40-71e4-405a-b626-d075893822ff','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-realm}','view-realm','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('4099fa40-32b8-4767-aab5-714c65490b21','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-identity-providers}','manage-identity-providers','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('42adef16-c0d0-4a09-90a3-30413fb23e9d','1d4ef6af-aee7-4d84-abee-2cd13ae52012',_binary '',NULL,'viewer','ilan','1d4ef6af-aee7-4d84-abee-2cd13ae52012',NULL),('458938bb-e39e-4dd1-b342-2772d41ebf9f','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_manage-consent}','manage-consent','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('476993b0-2d02-49ab-a19c-0aca9628f7ec','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_realm-admin}','realm-admin','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('48557f28-5e94-42e9-93b6-fe2ae6e169c1','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_view-consent}','view-consent','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('487c465a-afcd-4f52-ba60-236f29774bb2','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Endpoint Odata in sola lettura per elementi di produzione archiviati','viewArchivio','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('49eba3ad-972e-468a-b880-d1660c3d4644','8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',_binary '',NULL,'Viewer','ilan','8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',NULL),('4a92eed1-807b-4333-8592-d86838ffec95','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_query-groups}','query-groups','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('4e739502-e730-4418-8b21-f34eb5b557e6','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_create-client}','create-client','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('4fb5be07-d219-4c62-bbf7-f9907e2fee12','0b0a532b-0a49-4de0-973b-6a8f43cd501d',_binary '','Permette la visualizzazione della bolla d\'ingresso corrente in lavorazione sulla stazione 1','NoteListViewer','ilan','0b0a532b-0a49-4de0-973b-6a8f43cd501d',NULL),('50b788c5-9843-4cdb-97ab-3520ef359871','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Permette l\'invio di un elemento di produzione attiva nell\'archivio dei lavorati','SendToArchive','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('5111036d-ff06-4536-ae97-c3186454a807','1ffe0269-47db-40b4-a10f-d8ed839032b8',_binary '','Permette i metodi di get per i contatori','Viewer','ilan','1ffe0269-47db-40b4-a10f-d8ed839032b8',NULL),('5169827c-5cd1-470a-b503-d17b384ce552','7f8dd358-c87f-4dc1-a158-dde7c259d737',_binary '',NULL,'editor','ilan','7f8dd358-c87f-4dc1-a158-dde7c259d737',NULL),('51ebbd9c-39ae-44e5-8026-622b4a8a1741','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('533f19c0-7141-4066-9397-c5c77b8f53f9','436c8e6b-958f-4053-8771-b8b221a0e1fd',_binary '',NULL,'Editor','ilan','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL),('54f8784e-7a24-47f5-a591-80bcafea1e54','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_manage-account-links}','manage-account-links','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('55b58fbf-e185-4ba2-b18b-280290aed14a','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Dedicato alla visualizzazione dei dati di diagnostica interna dello SmartSight','Diagnostic','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('567778be-557e-4ab8-b6bd-915971159724','fc401ffd-dad4-45df-923a-1186c09ef560',_binary '','${role_read-token}','read-token','master','fc401ffd-dad4-45df-923a-1186c09ef560',NULL),('586937ff-b0b3-427d-9c8a-1e98c845d472','10afe5fe-3015-4fa4-8691-3d2c44256427',_binary '','Endpoint Odata in sola lettura per elementi di produzione attivi','viewLavorazione','ilan','10afe5fe-3015-4fa4-8691-3d2c44256427',NULL),('5955d34c-5aca-4914-b06c-a90b79b35d3a','022d79a4-c939-4955-8b37-03e37198ad42',_binary '',NULL,'admin','ilan','022d79a4-c939-4955-8b37-03e37198ad42',NULL),('5968ba02-9b6f-4199-9cf9-6ae9b1efd4bb','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_query-clients}','query-clients','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('5aafe447-cea5-4aba-8ffd-86a8ab3638a9','4000aaa4-7aba-49e4-9ed1-74dea9f2cfce',_binary '','${role_read-token}','read-token','ilan','4000aaa4-7aba-49e4-9ed1-74dea9f2cfce',NULL),('5c645751-1d4a-4a8a-a17c-c6f402baa775','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-realm}','manage-realm','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('5c840745-0b66-4088-8984-a135a695db6d','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_manage-account}','manage-account','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('64985732-3b19-41a4-945d-743fbd622818','57968d8e-c609-4e96-9367-3e7c56c2420f',_binary '',NULL,'creator','ilan','57968d8e-c609-4e96-9367-3e7c56c2420f',NULL),('65574087-699c-4049-8c9f-438e2e6961a0','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Dedicato alla visualizzazione dei dati di diagnostica interna dello SmartSight','Diagnostic','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('65b40741-8e8c-4b7e-a9c5-0783e1fa4970','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'impostazione degli esisti di lavorazione di verniciatura','ProductionSetResult','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('663bfaf8-2ba3-4cee-af1f-51ded9d4573a','1ffe0269-47db-40b4-a10f-d8ed839032b8',_binary '','Permette l\'incremento di un contatore','AddCounter','ilan','1ffe0269-47db-40b4-a10f-d8ed839032b8',NULL),('6653fb35-e6d9-403c-8d12-fb79c7a4eb81','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-clients}','manage-clients','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('679d3065-375b-4531-ab64-5ee33dc30241','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-users}','view-users','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('6837a8e8-6a45-4526-b292-a9c09deddcef','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-events}','manage-events','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('6840f517-617e-462f-802f-995e24cffc18','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-users}','view-users','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('692456da-a21b-44c8-8949-0ffce913d17d','0b0a532b-0a49-4de0-973b-6a8f43cd501d',_binary '','Permette la creazione della bolla d\'ingresso corrente in lavorazione sulla stazione 1','NoteListCreator','ilan','0b0a532b-0a49-4de0-973b-6a8f43cd501d',NULL),('6b8b8b48-1002-468b-9816-0dba8079366a','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'impostazione dello stato di lavorazione in corso','ProductionSetWorkOn','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('6beb0681-b3e6-4e44-b9f1-bb66d79c32e7','3061d99f-7724-4bfc-af02-66ff054dd130',_binary '',NULL,'editor','ilan','3061d99f-7724-4bfc-af02-66ff054dd130',NULL),('703aaeca-70e7-42e4-9c4f-18d7b1e63030','1ffe0269-47db-40b4-a10f-d8ed839032b8',_binary '','Permette l\'accesso alle funzioni di debug','Debug','ilan','1ffe0269-47db-40b4-a10f-d8ed839032b8',NULL),('7464dad9-0477-4229-b240-49aa9fb5f999','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'invio di un prodotto nell\'insieme degli elementi di produzione archiviati','ProductionSendToArchive','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('75efc06b-57c4-4df6-9d9c-b7462aaf63ec','10afe5fe-3015-4fa4-8691-3d2c44256427',_binary '','Endpoint Odata in sola lettura per le bolle d\'uscita della linea di verniciatura','viewNoteListOut','ilan','10afe5fe-3015-4fa4-8691-3d2c44256427',NULL),('761d93f4-0c69-4bd6-afd6-375d252f4b93','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'impostazione dello stato di lavorazione in corso','ProductionSetWorkOn','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('7849a0e7-6244-41a4-8fcc-a2c93da87448','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',_binary '',NULL,'HubMessage','ilan','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',NULL),('7867491e-2107-42de-8c6b-7f74cdbabd0a','d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',_binary '',NULL,'viewer','ilan','d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',NULL),('79a87729-78bd-40ec-a9ec-86a251b81a90','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_query-groups}','query-groups','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('79b85a18-41cb-4f7f-9df6-769146566fad','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-identity-providers}','view-identity-providers','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('7b1e114c-93b5-45b5-a1cd-b179e288ad40','28aede84-d151-4214-9a0c-fd03dd5b3f1a',_binary '',NULL,'Viewer','ilan','28aede84-d151-4214-9a0c-fd03dd5b3f1a',NULL),('7baf29f0-7865-44d8-8934-60e0410839a1','d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',_binary '',NULL,'admin','ilan','d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',NULL),('7bc17dbd-aa05-4ba7-b8db-e9525c820ef4','ilan',_binary '\0','${role_offline-access}','offline_access','ilan',NULL,NULL),('7ca7f69d-f3c1-413c-b836-39c90eb2768f','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Ruolo riservato alla gestione dei documenti di accettazione merce della Stazione 1','EntryDocManagement','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('7cca5b07-29c2-424f-9b2f-52443cbd6a78','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'invio di un prodotto nell\'insieme degli elementi di produzione archiviati','ProductionSendToArchive','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('7dd7e13f-1828-41db-bcfc-d20b12c31c8f','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_manage-account-links}','manage-account-links','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('7e2743b1-a05d-40d9-a208-535889b12b78','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',_binary '','Permette la creazione della bolla d\'ingresso corrente in lavorazione sulla stazione 1','NoteListCreator','ilan','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',NULL),('7f8d8645-e001-4abe-8ff4-b48b347967b8','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Ruolo riservato alla gestione dei documenti di accettazione merce della Stazione 1','EntryDocManagementFE','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('80008518-fa3a-453a-bdf3-7fc4f530df2c','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('817d3f07-d7d2-4cc8-af85-7ebe2ebb4f5f','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-identity-providers}','view-identity-providers','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('82efcde7-18f5-4a2b-b69a-ab900fabd5d5','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Ruolo riservato alla gestione dei documenti di accettazione merce della Stazione 1','EntryDocManagement','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('84a9d3c8-f547-44d3-a8ca-608970473059','793d1977-08f0-4766-8c19-50f970b4b0e6',_binary '','Permette l\'accesso alle funzioni di debug','Debug','ilan','793d1977-08f0-4766-8c19-50f970b4b0e6',NULL),('85077bbf-5f4a-4bd9-ac14-42e132985fde','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-clients}','manage-clients','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('85595b65-79bf-4883-8e8a-0e2adb4abc0f','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'accesso alle funzioni di debug esclusive per i SW di simulazione','Viewer','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('880f91f5-4ded-4c1f-9771-1480348a85ff','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-events}','view-events','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('88758635-2c63-41b6-8d7f-deb14041acb0','0cf6016a-3950-4267-8d6a-66c2dce33fc0',_binary '',NULL,'editor','ilan','0cf6016a-3950-4267-8d6a-66c2dce33fc0',NULL),('88a879d7-5b19-4fb0-9e97-a6cd83858b0b','57968d8e-c609-4e96-9367-3e7c56c2420f',_binary '','force_sequence','editor','ilan','57968d8e-c609-4e96-9367-3e7c56c2420f',NULL),('8b65bdc9-b74f-4cd1-9479-1d03efb8e03b','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_view-applications}','view-applications','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('8b9be0ce-d9b2-4404-88f2-c303d8396919','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'invio di un prodotto nell\'insieme degli elementi di produzione attiva','ProductionSendToActive','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('8c6d6420-f20e-4ee4-b701-e87c6b2e0876','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'impostazione degli esisti di rework per un prodotto','ProductionSetReworkResult','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('8e4469f9-e846-41dd-9f8a-4ba596885d66','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',_binary '',NULL,'Viewer','ilan','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',NULL),('907c2627-1707-4321-a288-93c5e32171da','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_impersonation}','impersonation','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('90c14e31-1a6c-424c-a58f-479675fbe4ad','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette la transazione per l\'inserimento di una bolla d\'ingresso','NoteListInTransaction','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('91892d13-834a-491d-91e5-e738a5013eed','3061d99f-7724-4bfc-af02-66ff054dd130',_binary '',NULL,'creator','ilan','3061d99f-7724-4bfc-af02-66ff054dd130',NULL),('93342626-bd5a-4ec0-8fef-fb07a4f2119b','7f8dd358-c87f-4dc1-a158-dde7c259d737',_binary '',NULL,'creator','ilan','7f8dd358-c87f-4dc1-a158-dde7c259d737',NULL),('9334496a-43ef-44b2-881e-639ed46e0518','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-clients}','view-clients','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('93742f28-fefd-4936-b81b-d0d06957e2a9','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'impostazione degli esisti di lavorazione di verniciatura','ProductionSetResult','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('937f46d2-bd96-453c-b929-1521f112e51e','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_query-groups}','query-groups','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('94f6a1dd-91ae-4d97-a019-d324c940af96','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_query-realms}','query-realms','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('9b168d47-9090-4b78-9ce8-abf02f4a7dea','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Riservato LanSystem','SuperAdmin','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('9cdd731a-2ae0-45f8-a502-fe33ef2811c2','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'impostazione degli esisti di qualità per un prodotto','ProductionSetQualityResult','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('9ce85ba6-d00b-4486-9937-80db305f4400','0cf6016a-3950-4267-8d6a-66c2dce33fc0',_binary '',NULL,'creator','ilan','0cf6016a-3950-4267-8d6a-66c2dce33fc0',NULL),('a096b720-46d2-4ead-9b3e-b10785f223eb','ilan',_binary '\0','${role_uma_authorization}','uma_authorization','ilan',NULL,NULL),('a1ee9af2-ef48-4556-951a-bc202ab99358','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-events}','view-events','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('a2c589a1-05d5-436b-92bb-3d457a5793b9','5b6b331f-965b-4709-a0db-f4cd8a4b6650',_binary '',NULL,'editor','ilan','5b6b331f-965b-4709-a0db-f4cd8a4b6650',NULL),('a320e7be-5baa-41a1-934d-b9b9725634dd','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'impostazione degli esisti di qualità per un prodotto','ProductionSetQualityResult','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('a4270bf8-cf3f-4ec7-90c6-43890ac9c809','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Endpoint OData in sola lettura per le bolle d\'uscita della linea di verniciatura','viewNoteListOut','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('a5d7b3e1-34bc-4ea0-9571-7df38cbc366c','3061d99f-7724-4bfc-af02-66ff054dd130',_binary '',NULL,'viewer','ilan','3061d99f-7724-4bfc-af02-66ff054dd130',NULL),('a8bacc3c-244b-46b8-8b51-5fa8ff9817be','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-authorization}','view-authorization','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('a9b1f530-a3ac-463e-82cd-318eafb9c40f','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_delete-account}','delete-account','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','ilan',_binary '\0','${role_default-roles}','default-roles-ilan','ilan',NULL,NULL),('aba2f581-2dcb-4cd4-a693-f22e4382ca42','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Endpoint OData in sola lettura per elementi di produzione attivi','viewLavorazione','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('abf6151a-ed63-484b-94a8-156e231477de','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-realm}','view-realm','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('ac0feacb-1cb2-498c-89c2-dc0816810673','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Gestione parametri di configurazione (manta-analytics)','PerformanceManager','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('ad7bb4d8-5e8e-4f69-8c3a-015d1cd9de98','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',_binary '','Riservato LanSystem','SuperAdmin','ilan','b7d5b1e6-788a-47da-94de-9a06c9c34e2f',NULL),('ae096d2a-b7a3-493e-9425-0ccd0f346e95','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-identity-providers}','view-identity-providers','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('b23ca1ac-ed16-4ab1-a407-aea535cbd58b','5b6b331f-965b-4709-a0db-f4cd8a4b6650',_binary '','','creator','ilan','5b6b331f-965b-4709-a0db-f4cd8a4b6650',NULL),('b3308968-51cf-4acd-9f7b-1476f5b12ca7','c1becbf8-bb52-474d-b54e-375b985048e4',_binary '',NULL,'viewer','ilan','c1becbf8-bb52-474d-b54e-375b985048e4',NULL),('b78727a8-e1c0-4d69-a9b5-2b4108782369','b0053e68-6374-4d95-8f5d-fdd03f59f512',_binary '','Endpoint OData in sola lettura per elementi di produzione archiviati','viewArchivio','ilan','b0053e68-6374-4d95-8f5d-fdd03f59f512',NULL),('b79b794f-250d-461b-9e8f-ec7c2fa7ba19','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-realm}','view-realm','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('b9c0561a-095c-42ad-841e-7e6d1d13f1cb','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_view-profile}','view-profile','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('ba3fb59f-2971-43de-acf6-401dd2f6c2b7','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Endpoint Odata in sola lettura per le bolle d\'ingresso della linea di verniciatura','viewNoteList','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('bb18a7cb-4abf-4b80-a928-43fa0c6e47fb','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'invio di un prodotto nell\'insieme degli elementi di produzione attiva','ProductionSendToActive','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('bb78046e-2d4a-4bec-a8c8-94b8a455c8c3','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-realm}','manage-realm','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('be500f6e-1a88-47be-afaf-577e3504666d','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',_binary '','Permette la creazione di una bolla di uscita','NoteListOutCreator','ilan','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',NULL),('bffac7b9-bafc-4468-b619-f33d2157fba0','b0053e68-6374-4d95-8f5d-fdd03f59f512',_binary '','Endpoint Odata in sola lettura per elementi di produzione attivi','viewLavorazione','ilan','b0053e68-6374-4d95-8f5d-fdd03f59f512',NULL),('c00d9eab-03d5-4e49-8271-112f85a27350','10afe5fe-3015-4fa4-8691-3d2c44256427',_binary '','Endpoint OData in sola lettura per elementi di produzione archiviati','viewArchivio','ilan','10afe5fe-3015-4fa4-8691-3d2c44256427',NULL),('c0e4d566-4863-4e0d-9ad5-16cb011955e8','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('c321d097-cbcd-4b05-a89c-6524634139b5','104510da-ddd8-4e94-af02-c1ede7bbeb46',_binary '','${role_delete-account}','delete-account','ilan','104510da-ddd8-4e94-af02-c1ede7bbeb46',NULL),('c46ddf8b-d978-46e6-b01c-2819d2119c21','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_manage-realm}','manage-realm','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('c47fb12f-1750-46ad-ab83-8fa409aca3aa','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_manage-authorization}','manage-authorization','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('c6682b08-ce7c-4a90-866b-1dcf494386c9','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_query-users}','query-users','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('c7007e58-9914-4508-925c-0922912514a2','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-events}','view-events','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('c8578114-4d73-44c5-92b0-89f3d21c6316','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Permette l\'invio di un elemento di produzione nell\'\'insieme degli elementi di produzione attiva','SendToActive','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('cba09b9c-2d4f-4b7b-ad2a-5d95a56bb7e6','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette l\'impostazione della della ricetta da utilizzare per la lavorazione','ProductionSetRecipe','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('cca025bf-3288-46d4-88b3-89f31316b966','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Ruolo ad uso esclusivo per la manutenzione del SW smartsight','Debug','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('ccdfbdec-797f-4c14-b58a-c617e8599d12','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Gestione parametri di configurazione (manta-analytics)','PerformanceManager','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('cd8172b2-7a0e-4f76-9995-173cedb868a5','9036c717-132d-401e-9a4c-a9d810fd20ea',_binary '','Permette la visualizzazione della bolla in compilazione','NoteListOutViewer','ilan','9036c717-132d-401e-9a4c-a9d810fd20ea',NULL),('cda20caf-9f68-42c3-84e1-09a349c45857','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-clients}','manage-clients','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('cf719258-a8ae-4e9d-bc3a-684a7ac2344e','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_create-client}','create-client','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('cf93f1cc-1d3b-4e76-8b12-40128669747a','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_view-profile}','view-profile','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('d24d6be8-723f-4ec2-89e5-8884a251fb55','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Endpoint OData in sola lettura per le bolle d\'uscita della linea di verniciatura','viewNoteListOut','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('d416e3d5-6a68-4e5e-82e6-4545f9ea646e','793d1977-08f0-4766-8c19-50f970b4b0e6',_binary '','Permette l\'incremento di un contatore','AddCounter','ilan','793d1977-08f0-4766-8c19-50f970b4b0e6',NULL),('d5261bc1-30b1-4ec5-8f92-c7b7342b6974','1d4ef6af-aee7-4d84-abee-2cd13ae52012',_binary '',NULL,'admin','ilan','1d4ef6af-aee7-4d84-abee-2cd13ae52012',NULL),('d5617b51-55cb-4bb4-af40-9eed648ebddd','10afe5fe-3015-4fa4-8691-3d2c44256427',_binary '','Endpoint Odata in sola lettura per le bolle d\'ingresso della linea di verniciatura','viewNoteList','ilan','10afe5fe-3015-4fa4-8691-3d2c44256427',NULL),('d5dc076e-899f-4b19-850c-8e9a1cea1a35','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'impostazione degli esisti di rework per un prodotto','ProductionSetReworkResult','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('d6909cf1-6b26-4f53-85a6-718033f45d60','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',_binary '','Permette la transazione per l\'inserimento di una bolla d\'ingresso','NoteListInTransaction','ilan','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('d711fb22-4153-4bc3-89ed-dbb15380a495','793d1977-08f0-4766-8c19-50f970b4b0e6',_binary '','Permette i metodi di get per i contatori','Viewer','ilan','793d1977-08f0-4766-8c19-50f970b4b0e6',NULL),('d7a647a9-0db4-46ca-834b-b21fc14e5d2b','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_query-clients}','query-clients','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette l\'accesso alle funzioni di debug esclusive per i SW di simulazione','Viewer','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('dc5996ce-5fb0-404b-8295-ffaa7ce4798f','3ee78251-694a-40a4-811a-4d7a2b16d739',_binary '',NULL,'HubMessage','ilan','3ee78251-694a-40a4-811a-4d7a2b16d739',NULL),('df9b1b14-dd95-48fc-b1cb-754a4289ba78','7a3a7598-71c8-484f-9d07-6805d8f362d4',_binary '',NULL,'Viewer','ilan','7a3a7598-71c8-484f-9d07-6805d8f362d4',NULL),('e01599a1-798c-4f24-b551-fc951dc3acba','1f372198-46d2-4260-b7d2-97ae1559984f',_binary '','Permette di utilizzare l\'interfaccia REST per la scrittura dei dati in memoria','writer','ilan','1f372198-46d2-4260-b7d2-97ae1559984f',NULL),('e062d4b9-cb88-4f3e-b1cf-6d0019550429','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-users}','manage-users','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('e4c5d130-75de-4154-8b33-e2e248064f88','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('e53aecaa-cbfa-4834-b291-6d4fa2ecf10d','991a12e5-39c9-42ff-a954-5457bfa3fa5a',_binary '','Ruolo riservato alla gestione dei documenti di accettazione merce della Stazione 1','EntryDocManagementFE','ilan','991a12e5-39c9-42ff-a954-5457bfa3fa5a',NULL),('e7f1f6f3-1711-4c6e-b39b-920fdd6b1632','57968d8e-c609-4e96-9367-3e7c56c2420f',_binary '',NULL,'viewer','ilan','57968d8e-c609-4e96-9367-3e7c56c2420f',NULL),('eb1c16a2-fc86-432e-9948-54949a98d435','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-authorization}','view-authorization','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('ecf050d8-107f-475e-8096-0040ec2574fe','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',_binary '','${role_view-authorization}','view-authorization','master','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',NULL),('ed9f9d9c-a3a6-4e32-bf58-ca795436dc91','7f8dd358-c87f-4dc1-a158-dde7c259d737',_binary '',NULL,'viewer','ilan','7f8dd358-c87f-4dc1-a158-dde7c259d737',NULL),('ef012f0c-cd2d-44db-93e5-05ba09905796','022d79a4-c939-4955-8b37-03e37198ad42',_binary '',NULL,'viewer','ilan','022d79a4-c939-4955-8b37-03e37198ad42',NULL),('ef0223f7-72c5-4a94-a465-0bf4cf948e26','9036c717-132d-401e-9a4c-a9d810fd20ea',_binary '','Permette la creazione di una bolla di uscita','NoteListOutCreator','ilan','9036c717-132d-401e-9a4c-a9d810fd20ea',NULL),('f0f1a814-0a3e-4da5-9839-d4778220fb34','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_query-realms}','query-realms','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('f15870db-6490-4c46-95e0-68127166ac71','c1becbf8-bb52-474d-b54e-375b985048e4',_binary '',NULL,'editor','ilan','c1becbf8-bb52-474d-b54e-375b985048e4',NULL),('f182e81f-3df2-4834-a5cb-baf9b4671c39','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',_binary '','${role_manage-account}','manage-account','master','4194e296-c277-49d1-bab3-a7ba3c7a0e8d',NULL),('f24ac29c-f679-4192-bb11-87ce84efee78','fc3586aa-ec51-4500-ae15-902b9d10cefe',_binary '',NULL,'viewer','ilan','fc3586aa-ec51-4500-ae15-902b9d10cefe',NULL),('f2a1cc79-9c41-43ef-a29e-773beeff6b1c','fc3586aa-ec51-4500-ae15-902b9d10cefe',_binary '',NULL,'admin','ilan','fc3586aa-ec51-4500-ae15-902b9d10cefe',NULL),('f2d0cfae-4768-4e66-96aa-d3435e0e5d3b','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_view-clients}','view-clients','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('f39dd7e4-7ae9-4cf9-b8c2-a6cf392ba94e','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-authorization}','manage-authorization','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('f8afa434-f0ae-4c20-a58d-51130fc382d9','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_query-clients}','query-clients','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('fd171724-d4f5-4b12-9006-dda77a0fbeb8','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',_binary '','${role_query-realms}','query-realms','ilan','e93ce65c-04c8-4b1e-a2a8-6e705386bdfa',NULL),('fd6533c9-111d-4f01-87ed-0f00e728276e','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('fda43783-aa8d-435d-9995-6410e4de05c4','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',_binary '','Permette la transazione per l\'inserimento di una bolla d\'uscita','NoteListOutTransaction','ilan','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('fedeb2e0-ef2c-46be-8943-5ec3eec55e30','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',_binary '','${role_view-users}','view-users','master','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',NULL),('ffcc0a34-b426-45bf-9b44-06686802417e','436c8e6b-958f-4053-8771-b8b221a0e1fd',_binary '',NULL,'Viewer','ilan','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('ins3r','16.1.0',1707731426);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0238c727-940d-4887-b31d-e7558116fcf8','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',NULL),('0932dff2-0a81-4fba-a90e-f69431d676bb','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'f7ca580d-b469-417d-8f23-bac2138714e1'),('11405021-8f52-413a-abd0-1e9696da40a1','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',NULL),('1339c342-d96f-462b-9535-17dbbf048d5b','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL),('14864bf1-590b-4d55-92c0-ce1036f638bb','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL),('1b5ba123-fcf2-46a0-99d3-325705ae0672','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','0fb85c66-b6cc-4035-8bab-28cefc9a29d1',NULL),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'904dbfab-9775-4298-a441-70251d7e7b94'),('229de0ad-2f8c-4b47-baca-9be011571c23','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ed4cd313-9dd4-4c4a-a54a-b628d930582c'),('24757e05-b1d7-470e-90e3-37386ae821ee','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('25d99511-95ef-4d55-ab9b-45f977876fbc','Roles','openid-connect','oidc-usermodel-client-role-mapper','d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',NULL),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','locale','openid-connect','oidc-usermodel-attribute-mapper','df6e25e1-7053-4a4c-8f80-7a3e69b539cf',NULL),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'00f78bef-b18d-4471-86e4-92d046c435c7'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('31e12448-6957-4818-9727-6540db92ba8e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f7ca580d-b469-417d-8f23-bac2138714e1'),('35a44487-9f82-4bf8-8bf3-28a6028ab60d','role list','saml','saml-role-list-mapper',NULL,'cdd8b18d-730d-4969-b7f0-554be85b99bd'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'db6efcfb-248c-4619-b992-a43f84bc1c0d'),('38f1a573-5ee5-41f2-9968-4db1b835334b','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',NULL),('40e1816f-4e7c-4465-8aab-db52d3e119c0','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'52172e66-02ec-4ec9-a335-f712252e6558'),('42e014da-4df7-47db-82df-5ac138568951','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'a8dacce7-da09-4093-b258-a2e77ab12417'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','0b0a532b-0a49-4de0-973b-6a8f43cd501d',NULL),('46beb539-9415-479b-b59c-24a9075935de','audience resolve','openid-connect','oidc-audience-resolve-mapper','f5b96d5b-2bae-4802-853e-9d5fd15846e0',NULL),('4b19e3eb-1323-41cd-afa4-99db98e34026','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'904dbfab-9775-4298-a441-70251d7e7b94'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',NULL),('52d2d6d3-721b-4691-947a-638ee2ef4f22','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','9036c717-132d-401e-9a4c-a9d810fd20ea',NULL),('550ed5c1-760e-4958-9b11-6020b6de8f5d','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','3ee78251-694a-40a4-811a-4d7a2b16d739',NULL),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',NULL),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','Roles','openid-connect','oidc-usermodel-client-role-mapper','1d4ef6af-aee7-4d84-abee-2cd13ae52012',NULL),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','Roles','openid-connect','oidc-usermodel-client-role-mapper','022d79a4-c939-4955-8b37-03e37198ad42',NULL),('65f66727-d8a5-4988-be37-d417f1020140','address','openid-connect','oidc-address-mapper',NULL,'3b6d4793-a50b-4e53-9c59-28070d3ed53a'),('66611097-9397-42bc-9c78-246e0ce0c893','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('6ee94486-079a-475a-a129-f2d87196f3dd','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('6fa52c55-da93-4137-aab7-52e694f86153','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'db6efcfb-248c-4619-b992-a43f84bc1c0d'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',NULL),('76e84967-4f28-4871-b83b-291a9c59c4c1','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','0b0a532b-0a49-4de0-973b-6a8f43cd501d',NULL),('79b603fb-12dd-4810-9105-455f05221790','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'52172e66-02ec-4ec9-a335-f712252e6558'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('7d295196-2146-4076-a933-05c4f6a50051','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ed4cd313-9dd4-4c4a-a54a-b628d930582c'),('84310e54-e20b-4b04-a0f1-387b0687f94d','username','openid-connect','oidc-usermodel-property-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('8f4d9b5a-b1d6-4eae-9a38-b3612c174381','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'93487a71-c45d-4fbe-8179-0047b04e18ed'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'b54310a6-7c4a-42b8-a142-3ab91ac3347e'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'00f78bef-b18d-4471-86e4-92d046c435c7'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',NULL),('95ee0576-1c11-4d54-9f2a-d29e121510d1','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'66aec351-f83e-442c-9d77-be504ad49a04'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('a0422528-1231-49d3-92bc-ad32381f507b','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('a235f92f-0e5b-47e9-837d-b1e0c5953314','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',NULL),('a2e25c13-d037-42da-ab8b-ca5986be3fc3','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'f7ca580d-b469-417d-8f23-bac2138714e1'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('a699e380-6781-42da-bd5e-793cd3fff939','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','9036c717-132d-401e-9a4c-a9d810fd20ea',NULL),('b927f464-162c-4731-90bc-01c4c1f97ed1','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','9036c717-132d-401e-9a4c-a9d810fd20ea',NULL),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','address','openid-connect','oidc-address-mapper',NULL,'d096da82-34cd-4614-8b13-3606f2f15683'),('bca37114-7acf-419a-ac1d-62237ffc1944','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','e2a90e83-7580-4e4a-aaa9-f1344cd497bf',NULL),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',NULL),('c782fc1a-1b15-4982-867f-644c706baf7e','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',NULL),('cb1027ce-5c43-477e-9b29-9143c2b885d0','full name','openid-connect','oidc-full-name-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('ce7c7981-b784-4adb-994a-504847d32b00','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','0fb85c66-b6cc-4035-8bab-28cefc9a29d1',NULL),('d0706e63-baa3-44b6-b9d6-f3bcdb81c2ef','full name','openid-connect','oidc-full-name-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('d0835980-d69f-4490-98c2-c42d5849b529','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','3ee78251-694a-40a4-811a-4d7a2b16d739',NULL),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('d7eb6db9-1735-4453-8827-7aedb928f73d','role list','saml','saml-role-list-mapper',NULL,'9bc79d01-3a01-43ce-821e-261107306d0d'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','0b0a532b-0a49-4de0-973b-6a8f43cd501d',NULL),('e0bf284d-3e1d-406a-883e-561e40ebe549','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'66aec351-f83e-442c-9d77-be504ad49a04'),('e2c0d25f-3ef4-4ba4-9271-6e17d72b14ca','audience resolve','openid-connect','oidc-audience-resolve-mapper','cb94b1a2-799f-4b48-aeec-fdca5bec2685',NULL),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','2ebf1d91-ac1c-4985-b6dd-14a82e35178d',NULL),('e9260abe-5cee-4a04-bed8-13efe383d06f','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','436c8e6b-958f-4053-8771-b8b221a0e1fd',NULL),('eb671114-2a51-487c-905a-c55dcadd6659','Roles','openid-connect','oidc-usermodel-client-role-mapper','fc3586aa-ec51-4500-ae15-902b9d10cefe',NULL),('ebb98702-468e-41d9-aba5-405257d44dc6','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','3ee78251-694a-40a4-811a-4d7a2b16d739',NULL),('f211f2df-ca22-41eb-8b33-e6040b3a1595','username','openid-connect','oidc-usermodel-property-mapper',NULL,'db376032-05a4-4936-bcdc-9b43dbb2c6bb'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','5df2c97f-f64e-4bae-8b5c-a810ac09cd22',NULL),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4281e214-3c52-4d23-8245-f5bf460a4c60'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','b6cabbb9-2beb-4825-821b-15b7ba94ed7d',NULL),('f94c13a2-c779-4ed6-af80-25db6f2c8c5f','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'db6efcfb-248c-4619-b992-a43f84bc1c0d'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','locale','openid-connect','oidc-usermodel-attribute-mapper','cac04663-a452-4803-baa4-e677f0ab16e0',NULL),('fb18f84c-ba93-402e-83a3-5b66d481a563','email','openid-connect','oidc-usermodel-property-mapper',NULL,'b54310a6-7c4a-42b8-a142-3ab91ac3347e'),('fd6bf405-05ab-47d6-881a-352bfd857386','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','0fb85c66-b6cc-4035-8bab-28cefc9a29d1',NULL);
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0238c727-940d-4887-b31d-e7558116fcf8','true','access.token.claim'),('0238c727-940d-4887-b31d-e7558116fcf8','clientId','claim.name'),('0238c727-940d-4887-b31d-e7558116fcf8','true','id.token.claim'),('0238c727-940d-4887-b31d-e7558116fcf8','String','jsonType.label'),('0238c727-940d-4887-b31d-e7558116fcf8','clientId','user.session.note'),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','true','access.token.claim'),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','clientAddress','claim.name'),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','true','id.token.claim'),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','String','jsonType.label'),('031883b3-a688-4ba3-8fd8-5b0812f02f9c','clientAddress','user.session.note'),('0932dff2-0a81-4fba-a90e-f69431d676bb','true','access.token.claim'),('0932dff2-0a81-4fba-a90e-f69431d676bb','zoneinfo','claim.name'),('0932dff2-0a81-4fba-a90e-f69431d676bb','true','id.token.claim'),('0932dff2-0a81-4fba-a90e-f69431d676bb','String','jsonType.label'),('0932dff2-0a81-4fba-a90e-f69431d676bb','zoneinfo','user.attribute'),('0932dff2-0a81-4fba-a90e-f69431d676bb','true','userinfo.token.claim'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','true','access.token.claim'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','resource_access.${client_id}.roles','claim.name'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','String','jsonType.label'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','true','multivalued'),('1069e1cf-6cc4-4f50-92bf-4cce4b1138ee','foo','user.attribute'),('11405021-8f52-413a-abd0-1e9696da40a1','true','access.token.claim'),('11405021-8f52-413a-abd0-1e9696da40a1','clientAddress','claim.name'),('11405021-8f52-413a-abd0-1e9696da40a1','true','id.token.claim'),('11405021-8f52-413a-abd0-1e9696da40a1','String','jsonType.label'),('11405021-8f52-413a-abd0-1e9696da40a1','clientAddress','user.session.note'),('1339c342-d96f-462b-9535-17dbbf048d5b','true','access.token.claim'),('1339c342-d96f-462b-9535-17dbbf048d5b','clientHost','claim.name'),('1339c342-d96f-462b-9535-17dbbf048d5b','true','id.token.claim'),('1339c342-d96f-462b-9535-17dbbf048d5b','String','jsonType.label'),('1339c342-d96f-462b-9535-17dbbf048d5b','clientHost','user.session.note'),('14864bf1-590b-4d55-92c0-ce1036f638bb','true','access.token.claim'),('14864bf1-590b-4d55-92c0-ce1036f638bb','clientId','claim.name'),('14864bf1-590b-4d55-92c0-ce1036f638bb','true','id.token.claim'),('14864bf1-590b-4d55-92c0-ce1036f638bb','String','jsonType.label'),('14864bf1-590b-4d55-92c0-ce1036f638bb','clientId','user.session.note'),('1b5ba123-fcf2-46a0-99d3-325705ae0672','true','access.token.claim'),('1b5ba123-fcf2-46a0-99d3-325705ae0672','clientId','claim.name'),('1b5ba123-fcf2-46a0-99d3-325705ae0672','true','id.token.claim'),('1b5ba123-fcf2-46a0-99d3-325705ae0672','String','jsonType.label'),('1b5ba123-fcf2-46a0-99d3-325705ae0672','clientId','user.session.note'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','true','access.token.claim'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','upn','claim.name'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','true','id.token.claim'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','String','jsonType.label'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','username','user.attribute'),('1f9480fc-0fe8-4db8-915f-e1f379da45a4','true','userinfo.token.claim'),('229de0ad-2f8c-4b47-baca-9be011571c23','true','access.token.claim'),('229de0ad-2f8c-4b47-baca-9be011571c23','picture','claim.name'),('229de0ad-2f8c-4b47-baca-9be011571c23','true','id.token.claim'),('229de0ad-2f8c-4b47-baca-9be011571c23','String','jsonType.label'),('229de0ad-2f8c-4b47-baca-9be011571c23','picture','user.attribute'),('229de0ad-2f8c-4b47-baca-9be011571c23','true','userinfo.token.claim'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','true','access.token.claim'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','groups','claim.name'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','true','id.token.claim'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','String','jsonType.label'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','true','multivalued'),('237a7b8d-1c52-47a7-bfc8-2c320a2f4777','foo','user.attribute'),('24757e05-b1d7-470e-90e3-37386ae821ee','true','access.token.claim'),('24757e05-b1d7-470e-90e3-37386ae821ee','birthdate','claim.name'),('24757e05-b1d7-470e-90e3-37386ae821ee','true','id.token.claim'),('24757e05-b1d7-470e-90e3-37386ae821ee','String','jsonType.label'),('24757e05-b1d7-470e-90e3-37386ae821ee','birthdate','user.attribute'),('24757e05-b1d7-470e-90e3-37386ae821ee','true','userinfo.token.claim'),('25d99511-95ef-4d55-ab9b-45f977876fbc','true','access.token.claim'),('25d99511-95ef-4d55-ab9b-45f977876fbc','roles','claim.name'),('25d99511-95ef-4d55-ab9b-45f977876fbc','true','id.token.claim'),('25d99511-95ef-4d55-ab9b-45f977876fbc','String','jsonType.label'),('25d99511-95ef-4d55-ab9b-45f977876fbc','true','multivalued'),('25d99511-95ef-4d55-ab9b-45f977876fbc','true','userinfo.token.claim'),('25d99511-95ef-4d55-ab9b-45f977876fbc','f1-gfsys','usermodel.clientRoleMapping.clientId'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','true','access.token.claim'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','zoneinfo','claim.name'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','true','id.token.claim'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','String','jsonType.label'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','zoneinfo','user.attribute'),('271ef81a-4b8e-4944-ad8f-5f142c276fbb','true','userinfo.token.claim'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','true','access.token.claim'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','locale','claim.name'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','true','id.token.claim'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','String','jsonType.label'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','locale','user.attribute'),('274b47f9-ee7e-4854-a4a1-bdeaefb25f44','true','userinfo.token.claim'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','true','access.token.claim'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','phone_number','claim.name'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','true','id.token.claim'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','String','jsonType.label'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','phoneNumber','user.attribute'),('2a0a8f18-4f36-4eab-8e7c-e8a0dee3567c','true','userinfo.token.claim'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','true','access.token.claim'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','middle_name','claim.name'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','true','id.token.claim'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','String','jsonType.label'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','middleName','user.attribute'),('2d821bcd-3d6d-44e0-9777-f056657dfd4b','true','userinfo.token.claim'),('31e12448-6957-4818-9727-6540db92ba8e','true','access.token.claim'),('31e12448-6957-4818-9727-6540db92ba8e','realm_access.roles','claim.name'),('31e12448-6957-4818-9727-6540db92ba8e','String','jsonType.label'),('31e12448-6957-4818-9727-6540db92ba8e','true','multivalued'),('31e12448-6957-4818-9727-6540db92ba8e','foo','user.attribute'),('35a44487-9f82-4bf8-8bf3-28a6028ab60d','Role','attribute.name'),('35a44487-9f82-4bf8-8bf3-28a6028ab60d','Basic','attribute.nameformat'),('35a44487-9f82-4bf8-8bf3-28a6028ab60d','false','single'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','true','access.token.claim'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','given_name','claim.name'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','true','id.token.claim'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','String','jsonType.label'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','firstName','user.attribute'),('363eb7d1-899e-491a-a23c-6e4ce7b216ba','true','userinfo.token.claim'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','true','access.token.claim'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','resource_access.${client_id}.roles','claim.name'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','String','jsonType.label'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','true','multivalued'),('37591feb-dcc6-459c-9e95-fee9fa68aff2','foo','user.attribute'),('38f1a573-5ee5-41f2-9968-4db1b835334b','true','access.token.claim'),('38f1a573-5ee5-41f2-9968-4db1b835334b','clientId','claim.name'),('38f1a573-5ee5-41f2-9968-4db1b835334b','true','id.token.claim'),('38f1a573-5ee5-41f2-9968-4db1b835334b','String','jsonType.label'),('38f1a573-5ee5-41f2-9968-4db1b835334b','clientId','user.session.note'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','true','access.token.claim'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','email_verified','claim.name'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','true','id.token.claim'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','boolean','jsonType.label'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','emailVerified','user.attribute'),('40e1816f-4e7c-4465-8aab-db52d3e119c0','true','userinfo.token.claim'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','true','access.token.claim'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','clientAddress','claim.name'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','true','id.token.claim'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','String','jsonType.label'),('442e3dee-ac8d-435a-b3df-68de1b8e3ea6','clientAddress','user.session.note'),('4b19e3eb-1323-41cd-afa4-99db98e34026','true','access.token.claim'),('4b19e3eb-1323-41cd-afa4-99db98e34026','given_name','claim.name'),('4b19e3eb-1323-41cd-afa4-99db98e34026','true','id.token.claim'),('4b19e3eb-1323-41cd-afa4-99db98e34026','String','jsonType.label'),('4b19e3eb-1323-41cd-afa4-99db98e34026','firstName','user.attribute'),('4b19e3eb-1323-41cd-afa4-99db98e34026','true','userinfo.token.claim'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','true','access.token.claim'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','groups','claim.name'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','true','id.token.claim'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','String','jsonType.label'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','true','multivalued'),('4c621c0e-fae4-46b2-b4b4-f12ab81a7454','foo','user.attribute'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','true','access.token.claim'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','clientHost','claim.name'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','true','id.token.claim'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','String','jsonType.label'),('4cadc219-3dfc-491c-9c1d-e39ebbb67bf5','clientHost','user.session.note'),('52d2d6d3-721b-4691-947a-638ee2ef4f22','true','access.token.claim'),('52d2d6d3-721b-4691-947a-638ee2ef4f22','clientId','claim.name'),('52d2d6d3-721b-4691-947a-638ee2ef4f22','true','id.token.claim'),('52d2d6d3-721b-4691-947a-638ee2ef4f22','String','jsonType.label'),('52d2d6d3-721b-4691-947a-638ee2ef4f22','clientId','user.session.note'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','true','access.token.claim'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','profile','claim.name'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','true','id.token.claim'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','String','jsonType.label'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','profile','user.attribute'),('550ed5c1-760e-4958-9b11-6020b6de8f5d','true','userinfo.token.claim'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','true','access.token.claim'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','clientId','claim.name'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','true','id.token.claim'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','String','jsonType.label'),('57cb8c5d-c4c8-4cf8-a910-5f40ec3e78f2','clientId','user.session.note'),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','true','access.token.claim'),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','clientHost','claim.name'),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','true','id.token.claim'),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','String','jsonType.label'),('587ccfe1-7bd5-4e89-bdb0-c0410b7a1490','clientHost','user.session.note'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','true','access.token.claim'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','roles','claim.name'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','true','id.token.claim'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','String','jsonType.label'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','true','multivalued'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','true','userinfo.token.claim'),('5b419923-8d64-4ba4-a63b-cbc81869e6a6','f5-gfsys','usermodel.clientRoleMapping.clientId'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','true','access.token.claim'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','roles','claim.name'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','true','id.token.claim'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','String','jsonType.label'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','true','multivalued'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','true','userinfo.token.claim'),('61247ac3-eeaa-4d13-b0e6-4fd78ec8fd5d','f1-grafana','usermodel.clientRoleMapping.clientId'),('65f66727-d8a5-4988-be37-d417f1020140','true','access.token.claim'),('65f66727-d8a5-4988-be37-d417f1020140','true','id.token.claim'),('65f66727-d8a5-4988-be37-d417f1020140','country','user.attribute.country'),('65f66727-d8a5-4988-be37-d417f1020140','formatted','user.attribute.formatted'),('65f66727-d8a5-4988-be37-d417f1020140','locality','user.attribute.locality'),('65f66727-d8a5-4988-be37-d417f1020140','postal_code','user.attribute.postal_code'),('65f66727-d8a5-4988-be37-d417f1020140','region','user.attribute.region'),('65f66727-d8a5-4988-be37-d417f1020140','street','user.attribute.street'),('65f66727-d8a5-4988-be37-d417f1020140','true','userinfo.token.claim'),('66611097-9397-42bc-9c78-246e0ce0c893','true','access.token.claim'),('66611097-9397-42bc-9c78-246e0ce0c893','website','claim.name'),('66611097-9397-42bc-9c78-246e0ce0c893','true','id.token.claim'),('66611097-9397-42bc-9c78-246e0ce0c893','String','jsonType.label'),('66611097-9397-42bc-9c78-246e0ce0c893','website','user.attribute'),('66611097-9397-42bc-9c78-246e0ce0c893','true','userinfo.token.claim'),('6ee94486-079a-475a-a129-f2d87196f3dd','true','access.token.claim'),('6ee94486-079a-475a-a129-f2d87196f3dd','updated_at','claim.name'),('6ee94486-079a-475a-a129-f2d87196f3dd','true','id.token.claim'),('6ee94486-079a-475a-a129-f2d87196f3dd','String','jsonType.label'),('6ee94486-079a-475a-a129-f2d87196f3dd','updatedAt','user.attribute'),('6ee94486-079a-475a-a129-f2d87196f3dd','true','userinfo.token.claim'),('6fa52c55-da93-4137-aab7-52e694f86153','true','access.token.claim'),('6fa52c55-da93-4137-aab7-52e694f86153','locale','claim.name'),('6fa52c55-da93-4137-aab7-52e694f86153','true','id.token.claim'),('6fa52c55-da93-4137-aab7-52e694f86153','String','jsonType.label'),('6fa52c55-da93-4137-aab7-52e694f86153','locale','user.attribute'),('6fa52c55-da93-4137-aab7-52e694f86153','true','userinfo.token.claim'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','true','access.token.claim'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','realm_access.roles','claim.name'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','String','jsonType.label'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','true','multivalued'),('71c90cbf-e19e-4309-9379-8f2b7098a76a','foo','user.attribute'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','true','access.token.claim'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','clientHost','claim.name'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','true','id.token.claim'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','String','jsonType.label'),('76c1744b-0f6c-43b9-aa92-89ee1a928f87','clientHost','user.session.note'),('76e84967-4f28-4871-b83b-291a9c59c4c1','true','access.token.claim'),('76e84967-4f28-4871-b83b-291a9c59c4c1','clientHost','claim.name'),('76e84967-4f28-4871-b83b-291a9c59c4c1','true','id.token.claim'),('76e84967-4f28-4871-b83b-291a9c59c4c1','String','jsonType.label'),('76e84967-4f28-4871-b83b-291a9c59c4c1','clientHost','user.session.note'),('79b603fb-12dd-4810-9105-455f05221790','true','access.token.claim'),('79b603fb-12dd-4810-9105-455f05221790','middle_name','claim.name'),('79b603fb-12dd-4810-9105-455f05221790','true','id.token.claim'),('79b603fb-12dd-4810-9105-455f05221790','String','jsonType.label'),('79b603fb-12dd-4810-9105-455f05221790','middleName','user.attribute'),('79b603fb-12dd-4810-9105-455f05221790','true','userinfo.token.claim'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','true','access.token.claim'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','email','claim.name'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','true','id.token.claim'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','String','jsonType.label'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','email','user.attribute'),('7bfcb753-0f6e-426c-8e31-6c8d3b8a7b0d','true','userinfo.token.claim'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','true','access.token.claim'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','birthdate','claim.name'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','true','id.token.claim'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','String','jsonType.label'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','birthdate','user.attribute'),('7d268afb-01fe-4b86-ad6e-0771cab778e7','true','userinfo.token.claim'),('7d295196-2146-4076-a933-05c4f6a50051','true','access.token.claim'),('7d295196-2146-4076-a933-05c4f6a50051','upn','claim.name'),('7d295196-2146-4076-a933-05c4f6a50051','true','id.token.claim'),('7d295196-2146-4076-a933-05c4f6a50051','String','jsonType.label'),('7d295196-2146-4076-a933-05c4f6a50051','username','user.attribute'),('7d295196-2146-4076-a933-05c4f6a50051','true','userinfo.token.claim'),('84310e54-e20b-4b04-a0f1-387b0687f94d','true','access.token.claim'),('84310e54-e20b-4b04-a0f1-387b0687f94d','preferred_username','claim.name'),('84310e54-e20b-4b04-a0f1-387b0687f94d','true','id.token.claim'),('84310e54-e20b-4b04-a0f1-387b0687f94d','String','jsonType.label'),('84310e54-e20b-4b04-a0f1-387b0687f94d','username','user.attribute'),('84310e54-e20b-4b04-a0f1-387b0687f94d','true','userinfo.token.claim'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','true','access.token.claim'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','picture','claim.name'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','true','id.token.claim'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','String','jsonType.label'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','picture','user.attribute'),('84ef0e39-d920-4308-8f1a-e5dc751f18ec','true','userinfo.token.claim'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','true','access.token.claim'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','clientId','claim.name'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','true','id.token.claim'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','String','jsonType.label'),('856f559f-06a0-4e12-8fde-5cfbfc140de0','clientId','user.session.note'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','true','access.token.claim'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','family_name','claim.name'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','true','id.token.claim'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','String','jsonType.label'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','lastName','user.attribute'),('86c28ad2-4415-49c5-a4a6-cab08045fbb4','true','userinfo.token.claim'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','true','access.token.claim'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','gender','claim.name'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','true','id.token.claim'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','String','jsonType.label'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','gender','user.attribute'),('8cb11854-2153-49c9-ad74-a6fa36e8c6c6','true','userinfo.token.claim'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','true','access.token.claim'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','email_verified','claim.name'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','true','id.token.claim'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','boolean','jsonType.label'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','emailVerified','user.attribute'),('8fd8189d-cc2d-44cc-8685-ef4f93f95984','true','userinfo.token.claim'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','true','access.token.claim'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','phone_number_verified','claim.name'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','true','id.token.claim'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','boolean','jsonType.label'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','phoneNumberVerified','user.attribute'),('931b8aa6-1ec7-4b54-8aec-cf8eaf78e2a5','true','userinfo.token.claim'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','true','access.token.claim'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','clientHost','claim.name'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','true','id.token.claim'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','String','jsonType.label'),('95beb5d5-42c1-4cb7-a330-9773d203bcae','clientHost','user.session.note'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','true','access.token.claim'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','nickname','claim.name'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','true','id.token.claim'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','String','jsonType.label'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','nickname','user.attribute'),('95ee0576-1c11-4d54-9f2a-d29e121510d1','true','userinfo.token.claim'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','true','access.token.claim'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','phone_number','claim.name'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','true','id.token.claim'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','String','jsonType.label'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','phoneNumber','user.attribute'),('9ebb2cfd-cfaf-48c8-85d7-1475e69cbd9a','true','userinfo.token.claim'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','true','access.token.claim'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','profile','claim.name'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','true','id.token.claim'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','String','jsonType.label'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','profile','user.attribute'),('9fefaced-ed8a-4ecf-b6a5-2aa5ec3486ad','true','userinfo.token.claim'),('a0422528-1231-49d3-92bc-ad32381f507b','true','access.token.claim'),('a0422528-1231-49d3-92bc-ad32381f507b','clientHost','claim.name'),('a0422528-1231-49d3-92bc-ad32381f507b','true','id.token.claim'),('a0422528-1231-49d3-92bc-ad32381f507b','String','jsonType.label'),('a0422528-1231-49d3-92bc-ad32381f507b','clientHost','user.session.note'),('a235f92f-0e5b-47e9-837d-b1e0c5953314','true','access.token.claim'),('a235f92f-0e5b-47e9-837d-b1e0c5953314','clientAddress','claim.name'),('a235f92f-0e5b-47e9-837d-b1e0c5953314','true','id.token.claim'),('a235f92f-0e5b-47e9-837d-b1e0c5953314','String','jsonType.label'),('a235f92f-0e5b-47e9-837d-b1e0c5953314','clientAddress','user.session.note'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','true','access.token.claim'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','nickname','claim.name'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','true','id.token.claim'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','String','jsonType.label'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','nickname','user.attribute'),('a416dead-3afb-4e36-aa2a-8da31b85fed0','true','userinfo.token.claim'),('a699e380-6781-42da-bd5e-793cd3fff939','true','access.token.claim'),('a699e380-6781-42da-bd5e-793cd3fff939','clientHost','claim.name'),('a699e380-6781-42da-bd5e-793cd3fff939','true','id.token.claim'),('a699e380-6781-42da-bd5e-793cd3fff939','String','jsonType.label'),('a699e380-6781-42da-bd5e-793cd3fff939','clientHost','user.session.note'),('b927f464-162c-4731-90bc-01c4c1f97ed1','true','access.token.claim'),('b927f464-162c-4731-90bc-01c4c1f97ed1','clientAddress','claim.name'),('b927f464-162c-4731-90bc-01c4c1f97ed1','true','id.token.claim'),('b927f464-162c-4731-90bc-01c4c1f97ed1','String','jsonType.label'),('b927f464-162c-4731-90bc-01c4c1f97ed1','clientAddress','user.session.note'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','true','access.token.claim'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','true','id.token.claim'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','country','user.attribute.country'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','formatted','user.attribute.formatted'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','locality','user.attribute.locality'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','postal_code','user.attribute.postal_code'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','region','user.attribute.region'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','street','user.attribute.street'),('b94d3c30-b7fa-4e01-bfab-344dfa5f83df','true','userinfo.token.claim'),('bca37114-7acf-419a-ac1d-62237ffc1944','true','access.token.claim'),('bca37114-7acf-419a-ac1d-62237ffc1944','clientAddress','claim.name'),('bca37114-7acf-419a-ac1d-62237ffc1944','true','id.token.claim'),('bca37114-7acf-419a-ac1d-62237ffc1944','String','jsonType.label'),('bca37114-7acf-419a-ac1d-62237ffc1944','clientAddress','user.session.note'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','true','access.token.claim'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','updated_at','claim.name'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','true','id.token.claim'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','String','jsonType.label'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','updatedAt','user.attribute'),('c0071f75-7497-4b08-bb84-7ecb9f6ff930','true','userinfo.token.claim'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','true','access.token.claim'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','gender','claim.name'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','true','id.token.claim'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','String','jsonType.label'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','gender','user.attribute'),('c1bc4441-4c44-41ce-a521-a9081cdf79dd','true','userinfo.token.claim'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','true','access.token.claim'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','clientAddress','claim.name'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','true','id.token.claim'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','String','jsonType.label'),('c2d0051e-322e-4c84-bd9b-9c3033ee3e48','clientAddress','user.session.note'),('c782fc1a-1b15-4982-867f-644c706baf7e','true','access.token.claim'),('c782fc1a-1b15-4982-867f-644c706baf7e','clientId','claim.name'),('c782fc1a-1b15-4982-867f-644c706baf7e','true','id.token.claim'),('c782fc1a-1b15-4982-867f-644c706baf7e','String','jsonType.label'),('c782fc1a-1b15-4982-867f-644c706baf7e','clientId','user.session.note'),('cb1027ce-5c43-477e-9b29-9143c2b885d0','true','access.token.claim'),('cb1027ce-5c43-477e-9b29-9143c2b885d0','true','id.token.claim'),('cb1027ce-5c43-477e-9b29-9143c2b885d0','true','userinfo.token.claim'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','true','access.token.claim'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','clientHost','claim.name'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','true','id.token.claim'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','String','jsonType.label'),('cdefd927-fe9f-4039-a1db-c9d1627b52e8','clientHost','user.session.note'),('ce7c7981-b784-4adb-994a-504847d32b00','true','access.token.claim'),('ce7c7981-b784-4adb-994a-504847d32b00','clientHost','claim.name'),('ce7c7981-b784-4adb-994a-504847d32b00','true','id.token.claim'),('ce7c7981-b784-4adb-994a-504847d32b00','String','jsonType.label'),('ce7c7981-b784-4adb-994a-504847d32b00','clientHost','user.session.note'),('d0706e63-baa3-44b6-b9d6-f3bcdb81c2ef','true','access.token.claim'),('d0706e63-baa3-44b6-b9d6-f3bcdb81c2ef','true','id.token.claim'),('d0706e63-baa3-44b6-b9d6-f3bcdb81c2ef','true','userinfo.token.claim'),('d0835980-d69f-4490-98c2-c42d5849b529','true','access.token.claim'),('d0835980-d69f-4490-98c2-c42d5849b529','family_name','claim.name'),('d0835980-d69f-4490-98c2-c42d5849b529','true','id.token.claim'),('d0835980-d69f-4490-98c2-c42d5849b529','String','jsonType.label'),('d0835980-d69f-4490-98c2-c42d5849b529','lastName','user.attribute'),('d0835980-d69f-4490-98c2-c42d5849b529','true','userinfo.token.claim'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','true','access.token.claim'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','clientAddress','claim.name'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','true','id.token.claim'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','String','jsonType.label'),('d1661e4b-2eec-4a4c-adba-1c3e125f78ab','clientAddress','user.session.note'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','true','access.token.claim'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','website','claim.name'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','true','id.token.claim'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','String','jsonType.label'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','website','user.attribute'),('d671447d-32ff-4c5a-8dc8-0bbdc4a3e236','true','userinfo.token.claim'),('d7eb6db9-1735-4453-8827-7aedb928f73d','Role','attribute.name'),('d7eb6db9-1735-4453-8827-7aedb928f73d','Basic','attribute.nameformat'),('d7eb6db9-1735-4453-8827-7aedb928f73d','false','single'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','true','access.token.claim'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','clientId','claim.name'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','true','id.token.claim'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','String','jsonType.label'),('dd04f8e3-8199-4630-8bb5-024bb8c10143','clientId','user.session.note'),('e0bf284d-3e1d-406a-883e-561e40ebe549','true','access.token.claim'),('e0bf284d-3e1d-406a-883e-561e40ebe549','phone_number_verified','claim.name'),('e0bf284d-3e1d-406a-883e-561e40ebe549','true','id.token.claim'),('e0bf284d-3e1d-406a-883e-561e40ebe549','boolean','jsonType.label'),('e0bf284d-3e1d-406a-883e-561e40ebe549','phoneNumberVerified','user.attribute'),('e0bf284d-3e1d-406a-883e-561e40ebe549','true','userinfo.token.claim'),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','true','access.token.claim'),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','clientId','claim.name'),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','true','id.token.claim'),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','String','jsonType.label'),('e6e4ef3e-0c38-4b17-a93f-683a238c6e72','clientId','user.session.note'),('e9260abe-5cee-4a04-bed8-13efe383d06f','true','access.token.claim'),('e9260abe-5cee-4a04-bed8-13efe383d06f','clientAddress','claim.name'),('e9260abe-5cee-4a04-bed8-13efe383d06f','true','id.token.claim'),('e9260abe-5cee-4a04-bed8-13efe383d06f','String','jsonType.label'),('e9260abe-5cee-4a04-bed8-13efe383d06f','clientAddress','user.session.note'),('eb671114-2a51-487c-905a-c55dcadd6659','true','access.token.claim'),('eb671114-2a51-487c-905a-c55dcadd6659','roles','claim.name'),('eb671114-2a51-487c-905a-c55dcadd6659','true','id.token.claim'),('eb671114-2a51-487c-905a-c55dcadd6659','String','jsonType.label'),('eb671114-2a51-487c-905a-c55dcadd6659','true','multivalued'),('eb671114-2a51-487c-905a-c55dcadd6659','true','userinfo.token.claim'),('eb671114-2a51-487c-905a-c55dcadd6659','f5-grafana','usermodel.clientRoleMapping.clientId'),('ebb98702-468e-41d9-aba5-405257d44dc6','true','access.token.claim'),('ebb98702-468e-41d9-aba5-405257d44dc6','clientHost','claim.name'),('ebb98702-468e-41d9-aba5-405257d44dc6','true','id.token.claim'),('ebb98702-468e-41d9-aba5-405257d44dc6','String','jsonType.label'),('ebb98702-468e-41d9-aba5-405257d44dc6','clientHost','user.session.note'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','true','access.token.claim'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','preferred_username','claim.name'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','true','id.token.claim'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','String','jsonType.label'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','username','user.attribute'),('f211f2df-ca22-41eb-8b33-e6040b3a1595','true','userinfo.token.claim'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','true','access.token.claim'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','clientAddress','claim.name'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','true','id.token.claim'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','String','jsonType.label'),('f3f8f2f6-373f-4d2c-9e8b-a4bde17cb9a9','clientAddress','user.session.note'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','true','access.token.claim'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','locale','claim.name'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','true','id.token.claim'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','String','jsonType.label'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','locale','user.attribute'),('f667189b-c3af-4ab3-83d3-a5eef69d20f9','true','userinfo.token.claim'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','true','access.token.claim'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','clientId','claim.name'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','true','id.token.claim'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','String','jsonType.label'),('f7d507a8-e1e3-4072-8c80-8abbf308bd2f','clientId','user.session.note'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','true','access.token.claim'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','locale','claim.name'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','true','id.token.claim'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','String','jsonType.label'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','locale','user.attribute'),('fa0d75d2-bd20-4d58-9f6e-a79da134fce3','true','userinfo.token.claim'),('fb18f84c-ba93-402e-83a3-5b66d481a563','true','access.token.claim'),('fb18f84c-ba93-402e-83a3-5b66d481a563','email','claim.name'),('fb18f84c-ba93-402e-83a3-5b66d481a563','true','id.token.claim'),('fb18f84c-ba93-402e-83a3-5b66d481a563','String','jsonType.label'),('fb18f84c-ba93-402e-83a3-5b66d481a563','email','user.attribute'),('fb18f84c-ba93-402e-83a3-5b66d481a563','true','userinfo.token.claim'),('fd6bf405-05ab-47d6-881a-352bfd857386','true','access.token.claim'),('fd6bf405-05ab-47d6-881a-352bfd857386','clientAddress','claim.name'),('fd6bf405-05ab-47d6-881a-352bfd857386','true','id.token.claim'),('fd6bf405-05ab-47d6-881a-352bfd857386','String','jsonType.label'),('fd6bf405-05ab-47d6-881a-352bfd857386','clientAddress','user.session.note');
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
INSERT INTO `REALM` VALUES ('ilan',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'ilan',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','f12bfcc4-87f4-4b12-907d-c8502ebfcd38',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','f9b3110b-20c0-4c4c-b19b-d48b3e1a1d04','ca13831a-c55e-4b96-b891-8dd9aa00718e','a080a8d9-476d-405c-98dd-059dbfcd8191','cba09e5d-b125-435e-a7a5-9f8fca64dc69','33d3c79b-84e5-4dd2-8380-3f022fe456c8',2592000,_binary '\0',900,_binary '',_binary '\0','a8806c9e-0e9e-4a0a-b63e-d6b2a2b16772',0,_binary '\0',0,0,'ab430f24-9a22-4ff8-bde0-4c5eb2c66185'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','87ffa0c3-1152-44f5-8d9b-fe8a2f0b140a',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','e9d7ec40-561f-491b-ad2b-deb801447d72','64c689de-ad02-461f-8179-52be62144636','885b6a46-61ab-47c1-8855-db1cd0bbdaab','64669c18-d6a5-4dac-b5e3-05722d2b877a','e9bcde96-e117-4a3a-a944-9de7efe417a9',2592000,_binary '\0',900,_binary '',_binary '\0','fc2f5f6d-08a1-473d-be5e-b9feedafd058',0,_binary '\0',0,0,'22991d03-8f98-40be-80f7-1838af1dd821');
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','ilan','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','ilan',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','ilan','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','ilan','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','ilan','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','ilan','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','ilan','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','ilan','43200'),('actionTokenGeneratedByUserLifespan','ilan','300'),('bruteForceProtected','ilan','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','ilan','login_hint'),('cibaBackchannelTokenDeliveryMode','ilan','poll'),('cibaExpiresIn','ilan','120'),('cibaInterval','ilan','5'),('defaultSignatureAlgorithm','ilan','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','ilan','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','ilan','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','ilan','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','ilan','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','ilan','600'),('oauth2DevicePollingInterval','ilan','5'),('offlineSessionMaxLifespan','ilan','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','ilan','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','ilan','60'),('permanentLockout','ilan','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','ilan','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','ilan','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','ilan','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','ilan','not specified'),('webAuthnPolicyAuthenticatorAttachment','ilan','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','ilan','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','ilan','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','ilan','false'),('webAuthnPolicyCreateTimeout','ilan','0'),('webAuthnPolicyCreateTimeoutPasswordless','ilan','0'),('webAuthnPolicyRequireResidentKey','ilan','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','ilan','not specified'),('webAuthnPolicyRpEntityName','ilan','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','ilan','keycloak'),('webAuthnPolicyRpId','ilan',''),('webAuthnPolicyRpIdPasswordless','ilan',''),('webAuthnPolicySignatureAlgorithms','ilan','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','ilan','ES256'),('webAuthnPolicyUserVerificationRequirement','ilan','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','ilan','not specified');
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
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('ilan','jboss-logging'),('master','jboss-logging');
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
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','ilan'),('password','password',_binary '',_binary '','master');
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
INSERT INTO `REDIRECT_URIS` VALUES ('022d79a4-c939-4955-8b37-03e37198ad42','https://f1.smartsight.it/grafana/login/generic_oauth'),('0b0a532b-0a49-4de0-973b-6a8f43cd501d','*'),('0cf6016a-3950-4267-8d6a-66c2dce33fc0','*'),('0fb85c66-b6cc-4035-8bab-28cefc9a29d1','*'),('104510da-ddd8-4e94-af02-c1ede7bbeb46','/realms/ilan/account/*'),('10afe5fe-3015-4fa4-8691-3d2c44256427','*'),('1d4ef6af-aee7-4d84-abee-2cd13ae52012','https://f5.smartsight.it/gfsys/login/generic_oauth'),('1f372198-46d2-4260-b7d2-97ae1559984f','*'),('1ffe0269-47db-40b4-a10f-d8ed839032b8','*'),('28aede84-d151-4214-9a0c-fd03dd5b3f1a','*'),('2ebf1d91-ac1c-4985-b6dd-14a82e35178d','*'),('3061d99f-7724-4bfc-af02-66ff054dd130','*'),('3233bbe5-5b78-4de0-aecc-3f84f311c029','*'),('3e619479-33ad-4782-8094-85f0b163c457','*'),('3ee78251-694a-40a4-811a-4d7a2b16d739','*'),('4194e296-c277-49d1-bab3-a7ba3c7a0e8d','/realms/master/account/*'),('436c8e6b-958f-4053-8771-b8b221a0e1fd','*'),('57968d8e-c609-4e96-9367-3e7c56c2420f','*'),('5b6b331f-965b-4709-a0db-f4cd8a4b6650','*'),('5df2c97f-f64e-4bae-8b5c-a810ac09cd22','*'),('7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db','*'),('793d1977-08f0-4766-8c19-50f970b4b0e6','*'),('7a3a7598-71c8-484f-9d07-6805d8f362d4','*'),('7f8dd358-c87f-4dc1-a158-dde7c259d737','*'),('8c6aeeb0-3e20-4c28-8105-92d2bfdf9666','*'),('9036c717-132d-401e-9a4c-a9d810fd20ea','*'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','https://f5.smartsight.it/*'),('a85b2042-6d3f-4ee5-af5a-a3ca6a6d6742','*'),('b0053e68-6374-4d95-8f5d-fdd03f59f512','*'),('b6cabbb9-2beb-4825-821b-15b7ba94ed7d','*'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','https://portal.smartsight.it/*'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','https://f1.smartsight.it/*'),('c1becbf8-bb52-474d-b54e-375b985048e4','*'),('cac04663-a452-4803-baa4-e677f0ab16e0','/admin/ilan/console/*'),('cb94b1a2-799f-4b48-aeec-fdca5bec2685','/realms/ilan/account/*'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e','https://f1.smartsight.it/gfsys/login/generic_oauth'),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','/admin/master/console/*'),('e2a90e83-7580-4e4a-aaa9-f1344cd497bf','*'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','/realms/master/account/*'),('fc3586aa-ec51-4500-ae15-902b9d10cefe','https://f5.smartsight.it/grafana/login/generic_oauth');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('046773c8-4a4b-427e-bb38-0aaa11704610','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('214e9e66-8dd5-40b8-96ef-7d96be80248e','VERIFY_EMAIL','Verify Email','ilan',_binary '',_binary '\0','VERIFY_EMAIL',50),('3844bb58-3a2a-4ffd-95e0-2033c206d208','delete_account','Delete Account','ilan',_binary '\0',_binary '\0','delete_account',60),('39eabf58-8921-441f-8529-ac380fbc9e10','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('5f221a8f-67c6-4f53-8d93-22ba2cabdfb1','CONFIGURE_TOTP','Configure OTP','ilan',_binary '',_binary '\0','CONFIGURE_TOTP',10),('6afd3cdb-6716-40c9-8a3b-3d90ab341878','terms_and_conditions','Terms and Conditions','ilan',_binary '\0',_binary '\0','terms_and_conditions',20),('706f5b03-8243-4ba5-bade-79717fbdafe3','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('75c58cab-4418-4689-b7e7-7e002154d405','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('7afc0bf1-ac0b-44a3-903f-735ad0e6f905','UPDATE_PASSWORD','Update Password','ilan',_binary '',_binary '\0','UPDATE_PASSWORD',30),('8cf70942-be7b-4f1d-afd4-26ecb76062aa','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('ae28c9fd-dc90-4400-8379-eab8c5139d8a','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('b69e9515-6c40-4ff9-a87a-7105b3cb447e','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('be4d10dc-c62f-4743-b4c5-2baa16d731c0','update_user_locale','Update User Locale','ilan',_binary '',_binary '\0','update_user_locale',1000),('f5a930fe-00bf-43e9-b316-c04118838e5e','UPDATE_PROFILE','Update Profile','ilan',_binary '',_binary '\0','UPDATE_PROFILE',40);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('cb94b1a2-799f-4b48-aeec-fdca5bec2685','5c840745-0b66-4088-8984-a135a695db6d'),('f5b96d5b-2bae-4802-853e-9d5fd15846e0','f182e81f-3df2-4834-a5cb-baf9b4671c39');
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
INSERT INTO `USER_ENTITY` VALUES ('0504072b-92f7-47ae-a4d0-2adfdee1c635',NULL,'5858e6f4-a6d0-4f6b-8bb9-77d3766c36fd',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-plcsimulator',1708005888762,'0fb85c66-b6cc-4035-8bab-28cefc9a29d1',0),('12f02239-7d79-48ce-a54d-234d9958ef00',NULL,'03a26d8d-c73b-4f59-b416-5a444d362d9d',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-stazione-1',1708004993101,'b6cabbb9-2beb-4825-821b-15b7ba94ed7d',0),('22189213-0d20-4149-801d-9b6b9c6c581d',NULL,'70787095-1788-4365-9d8d-0353e1415d6b',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f1-manta-traceability-app',1708006101108,'5df2c97f-f64e-4bae-8b5c-a810ac09cd22',0),('559387f7-5f35-4915-a71c-8d1359ab6196',NULL,'5914a90e-92a5-46a9-a4e3-0092ce650849',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f1-manta-stazione-6',1708005507858,'2ebf1d91-ac1c-4985-b6dd-14a82e35178d',0),('698bdfbb-1136-4b28-b171-3d9dd723163d',NULL,'087b4352-9059-4133-a2e7-7ca396c3403b',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-stazione-2',1708004823365,'3ee78251-694a-40a4-811a-4d7a2b16d739',0),('7b62770c-293e-4698-a938-44cf2ca5ea35',NULL,'b66fdb1d-889f-4140-8d23-3298d99883c6',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-analytics',1708004536850,'436c8e6b-958f-4053-8771-b8b221a0e1fd',0),('9ef8fc0c-6a28-4303-bf3d-268b4e81fba7','claudio.marcovecchio@lan-system.it','claudio.marcovecchio@lan-system.it',_binary '',_binary '',NULL,'Claudio','Marcovecchio','ilan','claudio.marcovecchio',1707738100585,NULL,0),('b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe',NULL,'303d743c-bbef-4829-acb1-7ba1aad8af7b',_binary '\0',_binary '',NULL,NULL,NULL,'master','lan',1707731428295,NULL,0),('ceb788f6-581d-4615-84f0-7613806a9f2c',NULL,'c3c47b94-b403-4559-9711-5a0fe297d55a',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-memdata-lavorazione',1708005694763,'8c6aeeb0-3e20-4c28-8105-92d2bfdf9666',0),('cf37a11e-fb21-407b-b7fc-0b5ae7506da8',NULL,'d0a4cdd4-3c3d-4fc3-8b34-0b12feeeaac3',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-stazione-3',1708005233637,'7825e7b1-7e5d-41e8-b24d-6cd3cc58c6db',0),('edc86b10-eb6a-43cd-b94a-1389fecee7e6',NULL,'d824e4c3-11fa-4885-88a9-c8be76df889b',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f1-manta-stazione-1',1708005074561,'0b0a532b-0a49-4de0-973b-6a8f43cd501d',0),('f018f134-5c86-4af1-b8f3-e9fb18ec4984',NULL,'02cba009-53eb-41ee-a150-560258b5370f',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-traceability-app',1708006052568,'e2a90e83-7580-4e4a-aaa9-f1344cd497bf',0),('fe7aba47-4c7b-4d77-8493-eb871dfa42da',NULL,'e53b3579-93f5-415d-8354-d3b5d191eede',_binary '\0',_binary '',NULL,NULL,NULL,'ilan','service-account-f5-manta-stazione-6',1708005474266,'9036c717-132d-401e-9a4c-a9d810fd20ea',0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0237057d-5af6-45ec-9312-066b3bd2c4c0','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('15ced5f0-6d4d-4ac9-84cb-0cf3e4297a60','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('2c8b9cc2-0302-4b94-a520-5b3f8062db9a','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('3568f8a1-e347-47c7-97d3-cc495c5d7b6e','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('65b40741-8e8c-4b7e-a9c5-0783e1fa4970','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('761d93f4-0c69-4bd6-afd6-375d252f4b93','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('7cca5b07-29c2-424f-9b2f-52443cbd6a78','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('7e2743b1-a05d-40d9-a208-535889b12b78','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('82efcde7-18f5-4a2b-b69a-ab900fabd5d5','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('8b9be0ce-d9b2-4404-88f2-c303d8396919','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('90c14e31-1a6c-424c-a58f-479675fbe4ad','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('a320e7be-5baa-41a1-934d-b9b9725634dd','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('cd8172b2-7a0e-4f76-9995-173cedb868a5','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('d5dc076e-899f-4b19-850c-8e9a1cea1a35','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('ef0223f7-72c5-4a94-a465-0bf4cf948e26','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('fda43783-aa8d-435d-9995-6410e4de05c4','0504072b-92f7-47ae-a4d0-2adfdee1c635'),('90c14e31-1a6c-424c-a58f-479675fbe4ad','12f02239-7d79-48ce-a54d-234d9958ef00'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','12f02239-7d79-48ce-a54d-234d9958ef00'),('5111036d-ff06-4536-ae97-c3186454a807','22189213-0d20-4149-801d-9b6b9c6c581d'),('663bfaf8-2ba3-4cee-af1f-51ded9d4573a','22189213-0d20-4149-801d-9b6b9c6c581d'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','22189213-0d20-4149-801d-9b6b9c6c581d'),('2f87b14a-1856-459f-9403-0578e99972b5','559387f7-5f35-4915-a71c-8d1359ab6196'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','559387f7-5f35-4915-a71c-8d1359ab6196'),('2c8b9cc2-0302-4b94-a520-5b3f8062db9a','698bdfbb-1136-4b28-b171-3d9dd723163d'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','698bdfbb-1136-4b28-b171-3d9dd723163d'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','698bdfbb-1136-4b28-b171-3d9dd723163d'),('16752d2c-bb01-4c93-839c-ef2e1ccf66c2','7b62770c-293e-4698-a938-44cf2ca5ea35'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','7b62770c-293e-4698-a938-44cf2ca5ea35'),('d711fb22-4153-4bc3-89ed-dbb15380a495','7b62770c-293e-4698-a938-44cf2ca5ea35'),('7baf29f0-7865-44d8-8934-60e0410839a1','9ef8fc0c-6a28-4303-bf3d-268b4e81fba7'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','9ef8fc0c-6a28-4303-bf3d-268b4e81fba7'),('088d9056-f583-45e7-9c5a-a1cf0ba40c92','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('22991d03-8f98-40be-80f7-1838af1dd821','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('2493bdb1-7f6b-4a91-9386-745db422e61c','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('2d3db1f4-4d2f-457f-b0b7-46e77f605551','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('2e65b02b-1fad-4a53-9abf-e0bc89cd81d9','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('5c645751-1d4a-4a8a-a17c-c6f402baa775','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('80008518-fa3a-453a-bdf3-7fc4f530df2c','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('937f46d2-bd96-453c-b929-1521f112e51e','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('a1ee9af2-ef48-4556-951a-bc202ab99358','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('ae096d2a-b7a3-493e-9425-0ccd0f346e95','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('b79b794f-250d-461b-9e8f-ec7c2fa7ba19','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('cda20caf-9f68-42c3-84e1-09a349c45857','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('d7a647a9-0db4-46ca-834b-b21fc14e5d2b','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('e062d4b9-cb88-4f3e-b1cf-6d0019550429','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('eb1c16a2-fc86-432e-9948-54949a98d435','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('f0f1a814-0a3e-4da5-9839-d4778220fb34','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('f39dd7e4-7ae9-4cf9-b8c2-a6cf392ba94e','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('fd6533c9-111d-4f01-87ed-0f00e728276e','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('fedeb2e0-ef2c-46be-8943-5ec3eec55e30','b35ebcdf-f722-4ae9-aaf3-f16f50ae4fbe'),('761d93f4-0c69-4bd6-afd6-375d252f4b93','ceb788f6-581d-4615-84f0-7613806a9f2c'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','ceb788f6-581d-4615-84f0-7613806a9f2c'),('e01599a1-798c-4f24-b551-fc951dc3acba','ceb788f6-581d-4615-84f0-7613806a9f2c'),('65b40741-8e8c-4b7e-a9c5-0783e1fa4970','cf37a11e-fb21-407b-b7fc-0b5ae7506da8'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','cf37a11e-fb21-407b-b7fc-0b5ae7506da8'),('db34fd0e-ab0b-4d84-9857-ce9cba3a36cc','cf37a11e-fb21-407b-b7fc-0b5ae7506da8'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','edc86b10-eb6a-43cd-b94a-1389fecee7e6'),('d6909cf1-6b26-4f53-85a6-718033f45d60','edc86b10-eb6a-43cd-b94a-1389fecee7e6'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','f018f134-5c86-4af1-b8f3-e9fb18ec4984'),('d416e3d5-6a68-4e5e-82e6-4545f9ea646e','f018f134-5c86-4af1-b8f3-e9fb18ec4984'),('d711fb22-4153-4bc3-89ed-dbb15380a495','f018f134-5c86-4af1-b8f3-e9fb18ec4984'),('ab430f24-9a22-4ff8-bde0-4c5eb2c66185','fe7aba47-4c7b-4d77-8493-eb871dfa42da'),('fda43783-aa8d-435d-9995-6410e4de05c4','fe7aba47-4c7b-4d77-8493-eb871dfa42da');
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
INSERT INTO `WEB_ORIGINS` VALUES ('3e619479-33ad-4782-8094-85f0b163c457','*'),('991a12e5-39c9-42ff-a954-5457bfa3fa5a','https://f5.smartsight.it'),('b774dac3-4fad-4cb0-81ec-d14866b3dd2e','https://portal.smartsight.it'),('b7d5b1e6-788a-47da-94de-9a06c9c34e2f','https://f1.smartsight.it'),('cac04663-a452-4803-baa4-e677f0ab16e0','+'),('d6bed3ff-5fae-45d9-bff6-6cb47ac40a3e',''),('df6e25e1-7053-4a4c-8f80-7a3e69b539cf','+');
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

-- Dump completed on 2024-02-15 15:36:22
