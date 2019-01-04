-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2018 at 01:49 AM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `griitchat`
--

-- --------------------------------------------------------

--
-- Table structure for table `airdrop_submits`
--

CREATE TABLE `airdrop_submits` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `note` text,
  `campaign_id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  `message` text,
  `status` int(11) DEFAULT NULL COMMENT '-1:Rejected 0:Pending 1:Approved.',
  `created_at` datetime DEFAULT NULL COMMENT 'created datetime'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airdrop_submits`
--

INSERT INTO `airdrop_submits` (`id`, `user_id`, `url`, `note`, `campaign_id`, `score`, `message`, `status`, `created_at`) VALUES
(1, 130, 'http://facebook.com', 'This is Awesome!', 1, 50, 'ffdgfdg', 1, '2018-06-16 17:25:25'),
(2, 130, 'http://twiter', NULL, 1, 150, 'ffdgfdg', 1, '2018-06-16 17:25:49'),
(3, 132, 'http://here', NULL, 1, 100, 'adskfjsadlkfjaslkdfjlasdf\nsadf\n\ndsafasdf', -1, '2018-06-16 17:26:05'),
(21, 130, NULL, 'Affiliate one user', 0, 100, NULL, 1, '2018-06-18 19:35:23'),
(22, 130, NULL, 'Affiliate one user', 0, 100, NULL, 1, '2018-06-18 19:35:32'),
(23, 130, NULL, 'Affiliate one user', 0, 100, NULL, 1, '2018-06-18 19:59:55'),
(27, 130, 'https://t.me/Blockchain_io', 'adsfdsf', 1, 50, ' ', 0, '2018-06-18 15:44:36'),
(28, 130, 'https://t.me/Blockchain_io_channel', 'asdfasdfgggggggg\r\ndfg\r\ndf\r\ngsdfg', 2, 500, ' adfsdfasdf\ndsaf\nasd\nf', 1, '2018-06-18 16:00:56'),
(29, 130, 'https://t.me/Blockchain_io_channel', 'dsaf', 2, 500, ' ', 0, '2018-06-18 16:09:14'),
(30, 130, 'https://t.me/Blockchain_io', 'sdfg', 1, 50, ' ', 0, '2018-06-18 16:09:17'),
(31, 130, 'https://www.reddit.com/r/blockchainio/comments/8fbgzo/welcome_to_the_internet_of_value/', 'hgf', 5, 50, ' ', 0, '2018-06-18 16:09:20'),
(32, 130, 'https://bitcointalk.org/index.php?topic=3681257.0', 'asdf', 8, 50, ' ', 0, '2018-06-18 16:09:24'),
(33, 133, 'https://t.me/Blockchain_io', 'adfsdfsdf', 1, 50, ' ', 0, '2018-06-18 18:21:09'),
(34, 133, 'https://t.me/Blockchain_io_channel', 'gfgfg', 2, 500, ' ', 0, '2018-06-18 18:21:13'),
(35, 153, 'https://t.me/Blockchain_io', '', 1, 50, ' ', 0, '2018-06-20 07:15:36'),
(36, 153, 'https://t.me/Blockchain_io', '', 1, 50, ' ', 0, '2018-06-20 07:15:39'),
(37, 153, 'https://t.me/Blockchain_io', '', 1, 50, ' ', 0, '2018-06-20 07:15:40'),
(38, 153, 'https://t.me/Blockchain_io', '', 6, 500, ' ', 0, '2018-06-20 07:15:43'),
(39, 153, 'https://t.me/Blockchain_io', '', 6, 500, ' ', 0, '2018-06-20 07:15:45'),
(40, 153, 'https://www.reddit.com/r/blockchainio/comments/8fbgzo/welcome_to_the_internet_of_value/', '', 5, 50, ' ', 0, '2018-06-20 07:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `airdrop_transaction`
--

CREATE TABLE `airdrop_transaction` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0' COMMENT 'Processed Score',
  `amount` double DEFAULT '0' COMMENT 'Ethereum Amount',
  `transaction_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airdrop_transaction`
--

INSERT INTO `airdrop_transaction` (`id`, `user_id`, `score`, `amount`, `transaction_id`, `created_at`) VALUES
(1, 130, 30, 30, '123123222', '2018-06-18 15:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `airdrop_user_info`
--

CREATE TABLE `airdrop_user_info` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `telegram` varchar(256) DEFAULT NULL,
  `bitcointalk` varchar(256) DEFAULT NULL,
  `linkedin` varchar(256) DEFAULT NULL,
  `reddit` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `twitter` varchar(256) DEFAULT NULL,
  `total_score` int(11) DEFAULT '0',
  `sent_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airdrop_user_info`
--

INSERT INTO `airdrop_user_info` (`id`, `user_id`, `telegram`, `bitcointalk`, `linkedin`, `reddit`, `avatar`, `twitter`, `total_score`, `sent_score`) VALUES
(1, 130, NULL, NULL, NULL, NULL, NULL, NULL, 930, 250),
(2, 132, NULL, NULL, NULL, NULL, NULL, NULL, 400, 100),
(3, 133, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 134, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(5, 135, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(6, 137, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(7, 138, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(8, 141, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(9, 142, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(10, 143, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(11, 144, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(12, 145, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(13, 146, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(14, 147, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(15, 148, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(16, 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(17, 151, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(18, 152, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(19, 153, '123asdfasd', '123555666', '123555666', '123asdf5555', '20180620181537.jpg', '123asdfasdfasdfasdf', 0, NULL),
(20, 154, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(21, 155, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(22, 157, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(23, 158, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(24, 159, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(25, 160, '', '', '', '', '20180620211022.jpg', '', 0, NULL),
(26, 161, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(27, 165, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_access_history`
--

CREATE TABLE `tbl_access_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sessionId` int(100) NOT NULL,
  `type` int(50) NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_access_history`
--

INSERT INTO `tbl_access_history` (`id`, `user_id`, `sessionId`, `type`, `created_at`) VALUES
(1, 1, 233, 1, '2018-10-13 03:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_call_history`
--

CREATE TABLE `tbl_call_history` (
  `id` int(11) NOT NULL,
  `type` enum('random','selective') NOT NULL,
  `caller_id` int(11) NOT NULL,
  `callee_id` int(11) NOT NULL,
  `connected_at` varchar(50) NOT NULL,
  `end_at` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_call_history`
--

INSERT INTO `tbl_call_history` (`id`, `type`, `caller_id`, `callee_id`, `connected_at`, `end_at`, `duration`) VALUES
(1, 'random', 1, 6, '2018-10-13 00:07:38', '2018-10-13 00:07:38', '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_config`
--

CREATE TABLE `tbl_config` (
  `config_key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_config`
--

INSERT INTO `tbl_config` (`config_key`, `value`) VALUES
('2checkout_private_key', 'privatekey'),
('2checkout_publishable_key', 'checkoutkey'),
('2checkout_seller_id', 'seled id'),
('2checkout_status', 'active'),
('90D0R06YX3XCQ0ME', '0'),
('about_company', 'A breakthrough digital solution involving currency trading helps to replace the world.'),
('accounting_snapshot', '1'),
('admin_btc_address', ''),
('admin_btc_email', ''),
('admin_btc_guid', ''),
('admin_btc_password', ''),
('admin_eth_pkey', ''),
('advcash_api_name', ''),
('advcash_api_password', ''),
('advcash_email', ''),
('advcash_sci_batch_key', ''),
('advcash_sci_name', ''),
('advcash_status', '0'),
('advcash_withdraw_email', ''),
('allowed_files', 'gif|png|jpeg|jpg|pdf|doc|txt|docx|xls|zip|rar|xls|mp4'),
('allow_client_registration', 'TRUE'),
('authorize', 'login id'),
('authorize_status', 'active'),
('authorize_transaction_key', 'transfer key'),
('automatic_email_on_recur', 'TRUE'),
('bank_address', 'Bank Address'),
('bank_cash', '0'),
('bank_city', 'Bank City'),
('bank_country', 'Bank Country'),
('bank_state_province', 'Bank State/Province'),
('bank_wire_status', '0'),
('bank_zip_code', 'Bank Zip/Postal Code'),
('beneficiary_bank_name', 'Beneficiary Bank Name'),
('benificiary_account_number', 'Benificiary Account Number'),
('bitcoin_address', 'Bitcoin Address'),
('bitcoin_comments', ''),
('bitcoin_merchant_id', ''),
('bitcoin_private_key', ''),
('bitcoin_public_key', ''),
('bitcoin_selectmode', '1'),
('bitcoin_status', '1'),
('bitcoin_title', 'Bitcoin'),
('braintree_default_account', 'Braintree Defual allcount'),
('braintree_live_or_sandbox', 'Braintree Live or Sandbox'),
('braintree_merchant_id', 'Braintree Merchant ID'),
('braintree_private_key', 'Braintree Private Key'),
('braintree_public_key', 'Braintree Defual allcount'),
('braintree_status', 'active'),
('btc_address', ''),
('btc_code', '0'),
('btc_link', '0'),
('btc_transaction_fees', '0.0005'),
('build', '0'),
('captcha_in_contact', '1'),
('captcha_in_login', '1'),
('captcha_in_reg', '1'),
('ccavenue_key', 'CCAvenue Working Key'),
('ccavenue_merchant_id', 'CCAvenue Merchant ID'),
('ccavenue_status', 'active'),
('coin', 'BTC'),
('coin_payments_ipn_key', ''),
('coin_payments_status', '0'),
('company_address', 'Address'),
('company_city', '3463464634563456'),
('company_country', 'Hong Kong'),
('company_domain', 'Dutertecoin'),
('company_email', 'support@bitnami.network'),
('company_legal_name', 'Dutertecoin'),
('company_logo', 'uploads/7932101aac7b4ccd84b47a4839c3cc29.jpg'),
('company_name', 'Dutertecoin'),
('company_phone', 'gadfgdgsdgsdfgsdfgdfgsdgdfg'),
('company_phone_2', ''),
('company_start', '2016-06-30'),
('company_vat', 'sdfgsdfg'),
('company_zip_code', 'sdfgdgsdgdgsdgsdg'),
('contact_person', '463463463463456435634563456'),
('contract_abi', '[{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"withdrawalRequests\",\"outputs\":[{\"name\":\"sinceTime\",\"type\":\"uint256\"},{\"name\":\"amount\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"version\",\"outputs\":[{\"name\":\"\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"v\",\"type\":\"uint256\"}],\"name\":\"calculateReward\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"},{\"name\":\"\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"name\":\"\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"decimals\",\"outputs\":[{\"name\":\"\",\"type\":\"uint8\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"name\":\"\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"initialSupply\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"feePot\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"timeWait\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"v\",\"type\":\"uint256\"}],\"name\":\"calculateFee\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"WithdrawalStarted\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"_owner\",\"type\":\"address\"},{\"indexed\":true,\"name\":\"_spender\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"_value\",\"type\":\"uint256\"}],\"name\":\"Approval\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"amount\",\"type\":\"uint256\"},{\"indexed\":false,\"name\":\"fee\",\"type\":\"uint256\"}],\"name\":\"WithdrawalQuick\",\"type\":\"event\"},{\"constant\":false,\"inputs\":[],\"name\":\"quickWithdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"timeToWait\",\"type\":\"uint256\"}],\"name\":\"WithdrawalPremature\",\"type\":\"event\"},{\"constant\":false,\"inputs\":[],\"name\":\"withdrawalInitiate\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"amount\",\"type\":\"uint256\"},{\"indexed\":false,\"name\":\"reward\",\"type\":\"uint256\"}],\"name\":\"WithdrawalDone\",\"type\":\"event\"},{\"constant\":false,\"inputs\":[{\"name\":\"_from\",\"type\":\"address\"},{\"name\":\"_to\",\"type\":\"address\"},{\"name\":\"_value\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[{\"name\":\"success\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"_spender\",\"type\":\"address\"},{\"name\":\"_value\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"name\":\"success\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"Deposited\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"by\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"feeRequired\",\"type\":\"uint256\"}],\"name\":\"IncorrectFee\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"name\":\"from\",\"type\":\"address\"},{\"indexed\":true,\"name\":\"to\",\"type\":\"address\"},{\"indexed\":false,\"name\":\"value\",\"type\":\"uint256\"}],\"name\":\"Transfer\",\"type\":\"event\"},{\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"fallback\"},{\"constant\":false,\"inputs\":[],\"name\":\"withdrawalComplete\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"_spender\",\"type\":\"address\"},{\"name\":\"_value\",\"type\":\"uint256\"},{\"name\":\"_extraData\",\"type\":\"bytes\"}],\"name\":\"approveAndCall\",\"outputs\":[{\"name\":\"success\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"name\":\"tokenName\",\"type\":\"string\"},{\"name\":\"decimalUnits\",\"type\":\"uint8\"},{\"name\":\"tokenSymbol\",\"type\":\"string\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"constant\":false,\"inputs\":[{\"name\":\"_to\",\"type\":\"address\"},{\"name\":\"_value\",\"type\":\"uint256\"}],\"name\":\"transfer\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]'),
('contract_address', '0x3b5d497c699a05eb94380d8382b958dbf16e7be4'),
('contract_live', '1'),
('contract_token_decimal', '0'),
('country', '0'),
('country_in_reg', '0'),
('cron_key', '34WI2L12L87I1A65M90M9A42N41D08A26I'),
('date_format', '%d-%m-%Y'),
('date_php_format', 'd-m-Y'),
('date_picker_format', 'dd-mm-yyyy'),
('decimal_separator', '0'),
('default_currency', '0'),
('default_currency_symbol', '$'),
('default_language', '0'),
('default_tax', '0'),
('default_terms', 'Thank you for <span style=\"font-weight: bold;\">your</span> business. Please process this invoice within the due date.'),
('demo_mode', 'FALSE'),
('developer', 'ig63Yd/+yuA8127gEyTz9TY4pnoeKq8dtocVP44+BJvtlRp8Vqcetwjk51dhSB6Rx8aVIKOPfUmNyKGWK7C/gg=='),
('display_estimate_badge', '0'),
('display_invoice_badge', 'FALSE'),
('email_account_details', 'TRUE'),
('email_estimate_message', 'Hi {CLIENT}<br>Thanks for your business inquiry. <br>The estimate EST {REF} is attached with this email. <br>Estimate Overview:<br>Estimate # : EST {REF}<br>Amount: {CURRENCY} {AMOUNT}<br> You can view the estimate online at:<br>{LINK}<br>Best Regards,<br>{COMPANY}'),
('email_invoice_message', 'Hello {CLIENT}<br>Here is the invoice of {CURRENCY} {AMOUNT}<br>You can view the invoice online at:<br>{LINK}<br>Best Regards,<br>{COMPANY}'),
('email_staff_tickets', 'TRUE'),
('enable_languages', '0'),
('envelope_link', 'sfdgdfgsdfgdfhdfhdfh'),
('estimate_color', '0'),
('estimate_language', 'en'),
('estimate_prefix', 'EST'),
('estimate_terms', 'Hey Looking forward to doing business with you.'),
('eth_address', '0x746b9ad455a716c9fcc7d01ac5556466a950ea0a'),
('eth_transaction_fees', '0'),
('exchange_disable_message', 'test'),
('exchange_enable', '1'),
('facebook_link', 'sfgs'),
('file_max_size', '80000'),
('gcal_api_key', ''),
('gcal_id', ''),
('google_captcha_key', '6LekjVAUAAAAACql65A6NR0c4WSifQX06HpoRK6i'),
('google_link', 'sdfgsdfgsd'),
('ico_enabled', '1'),
('ico_message', '<p>Coming soon..</p>\n'),
('increment_invoice_number', 'TRUE'),
('instagram_link', 'https://www.instagram.com/explore/tags/ecove/'),
('installed', 'TRUE'),
('invoices_due_after', '10'),
('invoice_color', '#53B567'),
('invoice_language', 'en'),
('invoice_logo', 'uploads/thumb.png'),
('invoice_prefix', 'INV-'),
('invoice_start_no', '0'),
('language', 'english'),
('languages', 'spanish'),
('last_check', '1436363002'),
('last_seen_activities', '0'),
('linkedin_link', 'sdfgsdfgsdg'),
('lisence_key', 'ooaPgynNvCtzs3ic2tIzRsMKOlaGaMn6A5aPMi0nlEejYBevadUSJDDXO6CS1Q7CWhrJAs6V7ke5WsB6GvZp9CmYIZRKQYmMgOwQgDMnY0sUt31az1AJDXHmWy7MxtzNh'),
('locale', 'en_IN'),
('login_bg', 'bg-login.jpg'),
('logofile', '0'),
('logo_or_icon', '0'),
('medium_link', 'dgsdfgsdfg'),
('notify_bug_assignment', 'TRUE'),
('notify_bug_comments', 'TRUE'),
('notify_bug_status', 'TRUE'),
('notify_message_received', 'TRUE'),
('notify_project_assignments', 'TRUE'),
('notify_project_comments', 'TRUE'),
('notify_project_files', 'TRUE'),
('notify_task_assignments', 'TRUE'),
('paper_plane_link', 'sdfgsdfgsdf'),
('payeer_account', ''),
('payeer_api_secret', ''),
('payeer_api_user', ''),
('payeer_shop_id', ''),
('payeer_shop_secret_key', ''),
('payeer_status', '0'),
('paypal_cancel_url', 'paypal/cancel'),
('paypal_email', 'support@bitnami.network'),
('paypal_ipn_url', 'paypal/t_ipn/ipn'),
('paypal_live', 'TRUE'),
('paypal_status', 'active'),
('paypal_success_url', 'paypal/success'),
('pdf_engine', 'invoicr'),
('perfect_money_account_id', ''),
('perfect_money_member_id', ''),
('perfect_money_phrase_hash', ''),
('perfect_money_status', '0'),
('postmark_api_key', '0'),
('postmark_from_address', '0'),
('project_prefix', 'PRO'),
('protocol', '0'),
('purchase_code', ''),
('recurring_invoice', '1'),
('reddit_link', 'sdfgsdfgsdfg'),
('ref_level_1', '0.05'),
('ref_level_2', '0.03'),
('ref_level_3', '0'),
('ref_level_4', '0'),
('ref_level_5', '0'),
('reminder_message', 'Hello {CLIENT}<br>This is a friendly reminder to pay your invoice of {CURRENCY} {AMOUNT}<br>You can view the invoice online at:<br>{LINK}<br>Best Regards,<br>{COMPANY}'),
('reset_key', '34WI2L12L87I1A65M90M9A42N41D08A26I'),
('routing_transfer_number', 'Routing Transfer Number (or) SWIFT Code (BIC)'),
('rows_per_table', '25'),
('security_token', '5027133599'),
('settings', 'theme'),
('show_estimate_tax', 'on'),
('show_invoice_tax', 'TRUE'),
('show_item_tax', '0'),
('show_login_image', 'TRUE'),
('show_only_logo', 'FALSE'),
('sidebar_theme', 'purple'),
('site_appleicon', 'logo.png'),
('site_author', 'William M.'),
('site_desc', 'Freelancer Office is a Web based PHP application for Freelancers - buy it on Codecanyon'),
('site_favicon', 'logo.png'),
('site_icon', 'fa-flask'),
('site_token_name', 'DU30'),
('site_token_short_name', 'DU30'),
('slack_link', 'sdfgsdfgfg'),
('smtp_host', '0'),
('smtp_pass', 'Dutertecoin123'),
('smtp_port', '0'),
('smtp_user', '0'),
('stripe_private_key', 'pk_test_ARblMczqDw61NusMMs7o1RVK'),
('stripe_public_key', 'pk_test_ARblMczqDw61NusMMs7o1RVK'),
('stripe_status', 'active'),
('system_font', 'roboto_condensed'),
('telegram', 'https://telegram.me/viccoin'),
('telegram_link', 'sfgsdfgsdfg'),
('thousand_separator', ','),
('timezone', 'America/New_York'),
('twitter_link', 'sdfgsdfgsdfg'),
('use_gravatar', 'TRUE'),
('use_mailgun', 'false'),
('use_postmark', '0'),
('valid_license', 'TRUE'),
('webmaster_email', 'support@bitnami.network'),
('website_name', 'Dutertecoin'),
('withdraw_allow_month', '4'),
('withdraw_commission', '5'),
('withdraw_maximum', '1000'),
('withdraw_minimum', '100'),
('X13RMT9FRC679GIR', '2018-04-04 14:20:07'),
('youtube_link', 'sdgsdfgsdg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_templates`
--

CREATE TABLE `tbl_email_templates` (
  `email_templates_id` int(11) NOT NULL,
  `email_group` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_body` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_email_templates`
--

INSERT INTO `tbl_email_templates` (`email_templates_id`, `email_group`, `subject`, `template_body`) VALUES
(1, 'registration', 'Registration successful', '<div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Welcome to {SITE_NAME}</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br>To open your {SITE_NAME} homepage, please follow this link:<br><big><b><a href=\"{SITE_URL}\">{SITE_NAME} Account!</a></b></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{SITE_URL}\">{SITE_URL}</a><br>Your username: {USERNAME}<br>Your email address: {EMAIL}<br>Your password: {PASSWORD}<br>Have fun!<br>The {SITE_NAME} Team.<br><br></div></div>'),
(2, 'forgot_password', 'Forgot Password', '        <div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">New Password</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">Forgot your password, huh? No big deal.<br>To create a new password, just follow this link:<br><br><big><b><a href=\"{PASS_KEY_URL}\">Create a new password</a></b></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{PASS_KEY_URL}\">{PASS_KEY_URL}</a><br><br><br>You received this email, because it was requested by a <a href=\"{SITE_URL}\">{SITE_NAME}</a> user. <p></p><p>This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.</p><br>Thank you,<br>The {SITE_NAME} Team</div></div>'),
(3, 'change_email', 'Change Email', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">New email address on {SITE_NAME}</div>\r\n\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">You have changed your email address for {SITE_NAME}.<br>Follow this link to confirm your new email address:<br><big><b><a href=\"{NEW_EMAIL_KEY_URL}\">Confirm your new email</a></b></big><br>Link doesn\'t work? Copy the following link to your browser address bar:<br><a href=\"{NEW_EMAIL_KEY_URL}\">{NEW_EMAIL_KEY_URL}</a><br><br>Your email address: {NEW_EMAIL}<br><br>You received this email, because it was requested by a <a href=\"{SITE_URL}\">{SITE_NAME}</a> user. If you have received this by mistake, please DO NOT click the confirmation link, and simply delete this email. After a short time, the request will be removed from the system.<br>Thank you,<br>The {SITE_NAME} Team</div>\r\n\r\n</div>'),
(4, 'activate_account', 'Activate Account', '<p>Welcome to {SITE_NAME}!</p>\r\n\r\n<p>Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.</p>\r\n\r\n<p>To verify your email address, please follow this link:<br />\r\n<big><strong><a href=\"{ACTIVATE_URL}\">Finish your registration...</a></strong></big><br />\r\nLink doesn&#39;t work? Copy the following link to your browser address bar:<br />\r\n<a href=\"{ACTIVATE_URL}\">{ACTIVATE_URL}</a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nYour username: {USERNAME}<br />\r\nYour email address: {EMAIL}<br />\r\nYour password: {PASSWORD}<br />\r\n<br />\r\nHave fun!<br />\r\nThe {SITE_NAME} Team</p>'),
(5, 'reset_password', 'Reset Password', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">New password on {SITE_NAME}</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>You have changed your password.<br>Please, keep it in your records so you don\'t forget it.<br></p>\r\nYour username: {USERNAME}<br>Your email address: {EMAIL}<br>Your new password: {NEW_PASSWORD}<br><br>Thank you,<br>The {SITE_NAME} Team</div>\r\n</div>'),
(6, 'bug_assigned', 'New Bug Assigned', '<p>Hi there,</p>\r\n\r\n<p>A new bug &nbsp;{BUG_TITLE} &nbsp;has been assigned to you by {ASSIGNED_BY}.</p>\r\n\r\n<p>You can view this bug by logging in to the portal using the link below.</p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{BUG_URL}\">View Bug</a></strong></big><br />\r\n<br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(7, 'bug_updated', 'Bug status changed', '<p>Hi there,</p>\r\n\r\n<p>Bug {BUG_TITLE} has been marked as {STATUS} by {MARKED_BY}.</p>\r\n\r\n<p>You can view this bug by logging in to the portal using the link below.</p>\r\n\r\n<p><big><strong><a href=\"{BUG_URL}\">View Bug</a></strong></big><br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(8, 'bug_comments', 'New Bug Comment Received', '<p>Hi there,</p>\r\n\r\n<p>A new comment has been posted by {POSTED_BY} to bug {BUG_TITLE}.</p>\r\n\r\n<p>You can view the comment using the link below.</p>\r\n\r\n<p><em>{COMMENT_MESSAGE}</em></p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{COMMENT_URL}\">View Comment</a></strong></big><br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(9, 'bug_attachment', 'New bug attachment', '<p>Hi there,</p>\r\n\r\n<p>A new attachment&nbsp;has been uploaded by {UPLOADED_BY} to issue {BUG_TITLE}.</p>\r\n\r\n<p>You can view the bug using the link below.</p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{BUG_URL}\">View Bug</a></strong></big></p>\r\n\r\n<p><br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(10, 'bug_reported', 'New bug Reported', '<p>Hi there,</p>\r\n\r\n<p>A new bug ({BUG_TITLE}) has been reported by {ADDED_BY}.</p>\r\n\r\n<p>You can view the Bug using the Dashboard Page.</p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{BUG_URL}\">View Bug</a></strong></big></p>\r\n\r\n<p><br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(13, 'refund_confirmation', 'Refund Confirmation', '<p>Refund Confirmation</p>\r\n\r\n<p>Hello {CLIENT}</p>\r\n\r\n<p>This is confirmation that a refund has been processed for Invoice&nbsp; of {CURRENCY} {AMOUNT}&nbsp;sent on {INVOICE_DATE}.<br />\r\nYou can view the invoice online at:<br />\r\n<big><strong><a href=\"{INVOICE_LINK}\">View Invoice</a></strong></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(14, 'payment_confirmation', 'Payment Confirmation', '<p>Payment Confirmation</p>\r\n\r\n<p>Hello {CLIENT}</p>\r\n\r\n<p>This is a payment receipt for your invoice of {CURRENCY} {AMOUNT}&nbsp;sent on {INVOICE_DATE}.<br />\r\nYou can view the invoice online at:<br />\r\n<big><strong><a href=\"{INVOICE_LINK}\">View Invoice</a></strong></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(15, 'payment_email', 'Payment Received', '<div style=\"height: 7px; background-color: #535353;\"></div>\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Payment Received</div>\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Dear Customer</p>\n<p>We have received your payment of {INVOICE_CURRENCY} {PAID_AMOUNT}. </p>\n<p>Thank you for your Payment and business. We look forward to working with you again.</p>\n--------------------------<br>Regards<br>The {SITE_NAME} Team</div>\n</div>'),
(16, 'invoice_overdue_email', 'Invoice Overdue Notice', '<p>Invoice Overdue</p>\r\n\r\n<p>INVOICE {REF}</p>\r\n\r\n<p><strong>Hello {CLIENT}</strong></p>\r\n\r\n<p>This is the notice that your invoice overdue.&nbsp;The invoice {CURRENCY} {AMOUNT}. and Due Date: {DUE_DATE}</p>\r\n\r\n<p>You can view the invoice online at:<br />\r\n<big><strong><a href=\"{INVOICE_LINK}\">View Invoice</a></strong></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(17, 'invoice_message', 'New Invoice', '<div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">INVOICE {REF}</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><span class=\"style1\"><span style=\"font-weight:bold;\">Hello {CLIENT}</span></span><br><br>Here is the invoice of {CURRENCY} {AMOUNT}.<br><br>You can view the invoice online at:<br><big><b><a href=\"{INVOICE_LINK}\">View Invoice</a></b></big><br><br>Best Regards<br><br>The {SITE_NAME} Team</div></div>'),
(18, 'invoice_reminder', 'Invoice Reminder', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Invoice Reminder</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Hello {CLIENT}</p>\r\n<br><p>This is a friendly reminder to pay your invoice of {CURRENCY} {AMOUNT}<br>You can view the invoice online at:<br><big><b><a href=\"{INVOICE_LINK}\">View Invoice</a></b></big><br><br>Best Regards,<br>The {SITE_NAME} Team</p>\r\n</div>\r\n</div>'),
(19, 'message_received', 'Message Received', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Message Received</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Hi {RECIPIENT},</p>\r\n<p>You have received a message from {SENDER}. </p>\r\n------------------------------------------------------------------<br><blockquote>\r\n{MESSAGE}</blockquote>\r\n<big><b><a href=\"{SITE_URL}\">Go to Account</a></b></big><br><br>Regards<br>The {SITE_NAME} Team</div>\r\n</div>'),
(20, 'estimate_email', 'New Estimate', '<p>Estimate {ESTIMATE_REF}</p>\r\n\r\n<p>Hi {CLIENT}</p>\r\n\r\n<p>Thanks for your business inquiry.</p>\r\n\r\n<p>The estimate {ESTIMATE_REF} is attached with this email.<br />\r\nEstimate Overview:<br />\r\nEstimate # : {ESTIMATE_REF}<br />\r\nAmount: {CURRENCY} {AMOUNT}<br />\r\n<br />\r\nYou can view the estimate online at:<br />\r\n<big><strong><a href=\"{ESTIMATE_LINK}\">View Estimate</a></strong></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(21, 'ticket_staff_email', 'New Ticket [TICKET_CODE]', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">New Ticket</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Ticket #{TICKET_CODE} has been created by the client.</p>\r\n<p>You may view the ticket by clicking on the following link <br><br>  Client Email : {REPORTER_EMAIL}<br><br> <big><b><a href=\"{TICKET_LINK}\">View Ticket</a></b></big> <br><br>Regards<br><br>{SITE_NAME}</p>\r\n</div>\r\n</div>'),
(22, 'ticket_client_email', 'Ticket [TICKET_CODE] Opened', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Ticket Opened</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Hello {CLIENT_EMAIL},<br><br></p>\r\n<p>Your ticket has been opened with us.<br><br>Ticket #{TICKET_CODE}<br>Status : Open<br><br>Click on the below link to see the ticket details and post additional comments.<br><br><big><b><a href=\"{TICKET_LINK}\">View Ticket</a></b></big><br><br>Regards<br><br>The {SITE_NAME} Team<br></p>\r\n</div>\r\n</div>'),
(23, 'ticket_reply_email', 'Ticket [TICKET_CODE] Response', '<div style=\"height: 7px; background-color: #535353;\"></div>\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Ticket Response</div>\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>A new response has been added to Ticket #{TICKET_CODE}<br><br> Ticket : #{TICKET_CODE} <br>Status : {TICKET_STATUS} <br><br></p>\nTo see the response and post additional comments, click on the link below.<br><br>         <big><b><a href=\"{TICKET_LINK}\">View Reply</a> </b></big><br><br>          Note: Do not reply to this email as this email is not monitored.<br><br>     Regards<br>The {SITE_NAME} Team<br></div>\n</div>'),
(24, 'ticket_closed_email', 'Ticket [TICKET_CODE] Closed', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Ticket Closed</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">Hi {REPORTER_EMAIL}<br><br>Ticket #{TICKET_CODE} has been closed by {STAFF_USERNAME} <br><br>          Ticket : #{TICKET_CODE} <br>     Status : {TICKET_STATUS}<br><br>Replies : {NO_OF_REPLIES}<br><br>          To see the responses or open the ticket, click on the link below.<br><br>          <big><b><a href=\"{TICKET_LINK}\">View Ticket</a></b></big> <br><br>          Note: Do not reply to this email as this email is not monitored.<br><br>    Regards<br>The {SITE_NAME} Team</div>\r\n</div>'),
(26, 'task_updated', 'Task updated', '<div style=\"height: 7px; background-color: #535353;\"></div>\r\n<div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Task updated</div>\r\n<div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Hi there,</p>\r\n<p>{TASK_NAME} in {PROJECT_TITLE} has been updated by {ASSIGNED_BY}.</p>\r\n<p>You can view this project by logging in to the portal using the link below.</p>\r\n-----------------------------------<br><big><b><a href=\"{PROJECT_URL}\">View Project</a></b></big><br><br>Regards<br>The {SITE_NAME} Team</div>\r\n</div>'),
(27, 'quotations_form', 'Your Quotation Request', '<p>QUOTATION</p>\r\n\r\n<p><strong>Hello {CLIENT}</strong><br />\r\n&nbsp;</p>\r\n\r\n<p>Thank you for you for filling in our Quotation Request Form.<br />\r\n<br />\r\nPlease find below are our quotation:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table cellpadding=\"8\" style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Quotation Date</td>\r\n			<td><strong>{DATE}</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Our Quotation</td>\r\n			<td><strong>{CURRENCY} {AMOUNT}</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Addtitional Comments</td>\r\n			<td><strong>{NOTES}</strong></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><br />\r\nYou can view the estimate online at:<br />\r\n<big><strong><a href=\"{QUOTATION LINK}\">View Quotation</a></strong></big></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\nThank you and we look forward to working with you.<br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(28, 'client_notification', 'New project created', '<p>Hello, <strong>{CLIENT_NAME}</strong>,<br />\r\nwe have created a new project with your account.<br />\r\n<br />\r\nProject name : <strong>{PROJECT_NAME}</strong><br />\r\nYou can login to see the status of your project by using this link:<br />\r\n<big><a href=\"{PROJECT_LINK}\"><strong>View Project</strong></a></big></p>\r\n\r\n<p><br />\r\nBest Regards<br />\r\n<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(29, 'assigned_project', 'Assigned Project', '<p>Hi There,</p>\r\n\r\n<p>A<strong> {PROJECT_NAME}</strong> has been assigned by <strong>{ASSIGNED_BY} </strong>to you.You can view this project by logging in to the portal using the link below:<br />\r\n<big><a href=\"{PROJECT_URL}\"><strong>View Project</strong></a></big><br />\r\n<br />\r\nBest Regards<br />\r\nThe {SITE_NAME} Team</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(30, 'complete_projects', 'Project Completed', '<p>Hi <strong>{CLIENT_NAME}</strong>,</p>\r\n\r\n<p>Project : <strong>{PROJECT_NAME}</strong> &nbsp;has been completed.<br />\r\nYou can view the project by logging into your portal Account:<br />\r\n<big><a href=\"{PROJECT_LINK}\"><strong>View Project</strong></a></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(31, 'project_comments', 'New Project Comment Received', '<p>Hi There,</p>\r\n\r\n<p>A new comment has been posted by <strong>{POSTED_BY}</strong> to project <strong>{PROJECT_NAME}</strong>.</p>\r\n\r\n<p>You can view the comment using the link below:<br />\r\n<big><a href=\"{COMMENT_URL}\"><strong>View Project</strong></a></big><br />\r\n<br />\r\n<em>{COMMENT_MESSAGE}</em><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(32, 'project_attachment', 'New Project  Attachment', '<p>Hi There,</p>\r\n\r\n<p>A new file has been uploaded by <strong>{UPLOADED_BY}</strong> to project <strong>{PROJECT_NAME}</strong>.<br />\r\nYou can view the Project using the link below:<br />\r\n<big><a href=\"{PROJECT_URL}\"><strong>View Project</strong></a></big><br />\r\n<br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(33, 'responsible_milestone', 'Responsible for a Milestone', '<p>Hi There,</p>\r\n\r\n<p>You are a responsible&nbsp;for a project milestone&nbsp;<strong>{MILESTONE_NAME}</strong>&nbsp; assigned to you by <strong>{ASSIGNED_BY}</strong> in project <strong>{PROJECT_NAME}</strong>.</p>\r\n\r\n<p>You can view this Milestone&nbsp;by logging in to the portal using the link below:<br />\r\n<big><strong><a href=\"{PROJECT_URL}\">View Project</a></strong></big><br />\r\n<br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(34, 'task_assigned', 'Task assigned', '<p>Hi there,</p>\r\n\r\n<p>A new task <strong>{TASK_NAME}</strong> &nbsp;has been assigned to you by <strong>{ASSIGNED_BY}</strong>.</p>\r\n\r\n<p>You can view this task by logging in to the portal using the link below.</p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{TASK_URL}\">View Task</a></strong></big><br />\r\n<br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(35, 'tasks_comments', 'New Task Comment Received', '<p>Hi There,</p>\r\n\r\n<p>A new comment has been posted by <strong>{POSTED_BY}</strong> to <strong>{TASK_NAME}</strong>.</p>\r\n\r\n<p>You can view the comment using the link below:<br />\r\n<big><strong><a href=\"{COMMENT_URL}\">View Comment</a></strong></big><br />\r\n<br />\r\n<em>{COMMENT_MESSAGE}</em><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(36, 'tasks_attachment', 'New Tasks Attachment', '<p>Hi There,</p>\r\n\r\n<p>A new file has been uploaded by <strong>{UPLOADED_BY} </strong>to Task <strong>{TASK_NAME}</strong>.<br />\r\nYou can view the Task&nbsp;using the link below:</p>\r\n\r\n<p><br />\r\n<big><a href=\"{TASK_URL}\"><strong>View Task</strong></a></big><br />\r\n<br />\r\nBest Regards,<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(37, 'tasks_updated', 'Task updated', '<p>Hi there,</p>\r\n\r\n<p>{<strong>TASK_NAME</strong>} has been updated by {<strong>ASSIGNED_BY</strong>}.</p>\r\n\r\n<p>You can view this Task by logging in to the portal using the link below.</p>\r\n\r\n<p><br />\r\n<big><strong><a href=\"{TASK_URL}\">View Task</a></strong></big><br />\r\n<br />\r\nRegards<br />\r\nThe {SITE_NAME} Team</p>\r\n'),
(38, 'contact_email', 'A user has contact for you his query', '<p>Hello Admin</p>\r\n\r\n<p>There is query from user at&nbsp;{SITE_NAME}.&nbsp;</p>\r\n\r\n<p>Below are the detail of user and about his comment:&nbsp;<br />\r\nEmail: {EMAIL}<br />\r\nSubject : {SUBJECT}<br />\r\nMessage: {MESSAGE}</p>\r\n\r\n<p><br />\r\nHave fun!<br />\r\nThe {SITE_NAME} Team.</p>\r\n'),
(39, 'withdraw_email_to_admin', 'A user has sent a withdrawal request of amount ${AMOUNT}.', '<p>Hello Admin</p>\r\n\r\n<p>A user has sent a withdrawal request at&nbsp;{SITE_NAME}.&nbsp;</p>\r\n\r\n<p>Below are the detail of withdrawal request:&nbsp;<br />\r\nUser: {USER}<br />\r\nRequest Date: {REQUEST_DATE}<br />\r\nAmount: $ {AMOUNT}<br />\r\nComment: {COMMENT}</p>\r\n\r\n<p><br />\r\nRegards!<br />\r\nThe {SITE_NAME} Team.</p>\r\n'),
(40, 'withdraw_email_to_user', 'Admin has approved your withdrawal request of amount ${AMOUNT}.', '<p>Hi {USERNAME}</p>\n\n<p>Admin has approved your withdrawal request at&nbsp;{SITE_NAME}.&nbsp; of amount ${AMOUNT}</p>\n\n\n<p><br />\nRegards!<br />\nThe {SITE_NAME} Team.</p>\n'),
(41, 'new_enquiry', 'New Enquiry Received ', '<p>Hello Admin</p>\n\n<p>You have new Enquiry from {NAME}.Details as follows</p>\n\n<p>Enquiry By - {NAME}<br />\nEnquiry By Email - {EMAIL}<br />\nEnquiry Subject - {SUBJECT}<br />\nEnquiry Message - </p>\n\n<p>{MESSAGE}</p>\n\n<p><br />\nThank you,<br />\nThe {SITE_NAME} Team</p>\n'),
(42, 'auth_code', '2 Factor Authorization Code ', '<div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">2 Factor Autorization Code</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">Here following is pincode for this time login. You can use it with in 10 minutes.<br></big><br>User: {USERNAME}<br/>Pincode : {PINCODE}</p><br>Thank you,<br>The {SITE_NAME} Team</div></div>'),
(43, 'confirm_security_code', 'Confirm Security Code', '<div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">Dear {USERNAME} , <br>Security Code for withdraw BTC on {SITE_NAME}</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\"><p>Please use below security code to confirm withdraw BTC.<br></p>Security Code : {SECURITYCODE}<br><br>Thank you,<br>The {SITE_NAME} Team</div></div>'),
(44, 'token_sale', 'Token Confirmation', '<p>Dear {USERNAME},</p><p>You have succesfully purchased viccoin tokens. We listed your token details below, make sure you keep them safe.</p><p><br /><br />Token Amount: {TOKENAMOUNT}<br />Address	: {ADDRESS}<br />Total Amount: {TOTALAMOUNT}<br /><br />Have fun!<br />The {SITE_NAME} Team</p>'),
(45, 'budget_query', 'Someone is interested in Viccoin!!!', '<p>Dear Admin,</p>\n\n<p>Someone is interested in Viccoin!!</p>\n\n<p>The details of user is as following:</p>\n\n<p>Email: {EMAIL}</p>\n\n<p>Amount : {AMOUNT}</p>\n\n<p>User hears about us from : {MEDIA}</p>\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>{COMPANY_NAME} Team</p>\n\n<p>&nbsp;</p>\n'),
(46, 'admin_auth_code', '2 Factor Authorization Code ', '<div style=\"height: 7px; background-color: #535353;\"></div><div style=\"background-color:#E8E8E8; margin:0px; padding:55px 20px 40px 20px; font-family:Open Sans, Helvetica, sans-serif; font-size:12px; color:#535353;\"><div style=\"text-align:center; font-size:24px; font-weight:bold; color:#535353;\">2 Factor Autorization Code</div><div style=\"border-radius: 5px 5px 5px 5px; padding:20px; margin-top:45px; background-color:#FFFFFF; font-family:Open Sans, Helvetica, sans-serif; font-size:13px;\">Here following is pincode for this time login.<br></big><br>User: {USERNAME}<br/>Code : {PINCODE}</p><br><br>Thank you,<br>The {SITE_NAME} Team</div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cup_count` varchar(50) NOT NULL,
  `used_cup` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`id`, `user_id`, `cup_count`, `used_cup`, `price`, `created_at`) VALUES
(1, 6, '50', 25, '250', '2018-10-13 00:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_report`
--

CREATE TABLE `tbl_report` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `report` varchar(255) NOT NULL,
  `report_image` varchar(255) NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_report`
--

INSERT INTO `tbl_report` (`id`, `user_id`, `reporter_id`, `report`, `report_image`, `created_at`) VALUES
(1, 6, 1, 'dasdas', '', '2018-10-12 22:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `online_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = online 0 = offline ',
  `enable_2_auth` int(11) NOT NULL DEFAULT '0',
  `auth_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_code_time` datetime DEFAULT NULL,
  `btc_wallet` decimal(15,10) DEFAULT NULL,
  `btc_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btc_guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btc_wallet_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_factor_permission` int(11) NOT NULL DEFAULT '0',
  `google_auth_code` text COLLATE utf8_unicode_ci NOT NULL,
  `eth_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eth_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eth_pkey` text COLLATE utf8_unicode_ci,
  `eth_pubkey` text COLLATE utf8_unicode_ci,
  `eth_balance` decimal(15,10) NOT NULL DEFAULT '0.0000000000',
  `photoUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `lgbtq` int(11) NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `firstName`, `lastName`, `username`, `social`, `password`, `phoneNumber`, `email`, `role_id`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`, `online_status`, `enable_2_auth`, `auth_code`, `auth_code_time`, `btc_wallet`, `btc_address`, `btc_guid`, `btc_wallet_password`, `two_factor_permission`, `google_auth_code`, `eth_address`, `eth_password`, `eth_pkey`, `eth_pubkey`, `eth_balance`, `photoUrl`, `gender`, `lgbtq`, `city`, `state`, `country`, `birthday`, `video_url`) VALUES
(1, 'leoruzin', 'leoruzin', 'CoolFriend', '', '0da3107ba813c8adc55c3eb8a61cbbcd7ff77350fb6f9f37741b9d5bdfc59cd90a39a2d7110e3ecdeaffa47ce061e3d8b0b8a0171fb6a96092e9e80ba8f73f2c', '+4040404', 'squad@coolfriend.co', 1, 1, 0, NULL, 'ef935fdddfcb1c6b3384eb2c457fbda0', '2018-01-31 00:41:07', NULL, NULL, NULL, '0000-00-00 00:00:00', '2018-01-10 00:00:00', '2018-10-15 07:09:40', 1, 0, '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0, '', '0x620aeb38271c181CF3049fcD11b6C04d4d688277', 'ecove@123', 'c8df981aa481f50564037f8e9cb4535a464ece3e3321e5b77f49dec8c1862ad9', NULL, '0.0000000000', '', 0, 0, 'Lucknow', '', 'Ind', '', ''),
(6, 'ecove', 'ecove', 'ecove', 'Google', '17ada7ce7a6a9f01f0aabbb431321d365b01a3e3474f107562e738afbfe0c13abf9ea7ee61e22c990912fd2bc5ef0e4c657b4c82f132bf8e79f6dacb14d3c466', '+565656565', 'testecove@gmail.com', 2, -1, 0, NULL, NULL, NULL, NULL, NULL, '122.173.130.26', '2018-03-29 06:23:21', '2018-01-17 04:05:12', '2018-10-15 07:09:45', 0, 0, '', '0000-00-00 00:00:00', '0.0000000000', '1LKWThzfM8UcW5rkNUEgYgvfGxAp3qj29s', 'e7bb6669-38bd-4b34-92b5-e6ac230d9a75', 'MTIzNDU2', 0, 'AZGAYL3G6VAXURGM', '0x8f4E6245B110148552DcDbc18D073E416a0E1b87', 'ecove@123', '81afaa5b02ef7326d7b79ca0b4c61331fb0feef470f2d6601587278144ce3c3e', NULL, '0.0000000000', '', 1, 1, 'New York', 'Western New York', 'USA', '', ''),
(130, '', '', 'leosuzin', 'Facebook', '01b0611a3c394d8ad4135ffa6883e63c7f965111543b0bc517b2a6343cf75003e1323e0429fcc12608c202110a9121a65a5cf97beb0e746ab520bf4bcb4f5591', '+40502340', 'leosuzin1126@gmail.com', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, '0', '2018-06-07 11:22:14', '2018-04-02 15:04:30', '2018-10-15 07:09:51', 1, 0, NULL, NULL, '0.0000000000', '14bQT1T99kiJWWYPmyt6L85a4TLDifFuXz', '210c2414-78ca-4426-87b7-da72a2798460', 'OTg3NjU0MzIxLy4=', 0, '2BUF4MSTVAJ66Z7J', '0xf9C926B9a46E2EFdAC80AcB50397F6bC9d99ac55', 'Yml0c29uaWMxMjNRV0U=', 'OGIzYjVmYTRhYWU5MzI0NTExMTVmZTlhYjQyY2VhZjNjMTExZDQ2NTQ5ZjUwZmUxNzI1NTczYjZhYzdhMmU2ZQ==', 'MHhkODdlZmU2NzdkNTk2OTRlZjcwMzU2MzFjZTg0MGY1ZmJhYzAzN2U0MWVjM2Q4MzUyNTNiMWE3MWUyMTU2ZTEzZjUxOGMxN2RhOTM1NjZmZDY3OTIyNmNlMWY3ZmFjYmY1N2VlMzA0Yzg4OWIwNGY2ZTRkZDhjMTE2MDRjNmIyNA==', '0.0000000000', '', 0, 0, 'New York', 'North Country', '', '', ''),
(132, '', '', 'captainhook', 'Google', 'bbe7b6fc269417bc6595824d0b93a41d7ee9b74671609f58f290c28095c2742b2675944231aff0772c9daf0cf5a3fc2b042d2b70e799cbe7448dca6f3b42860a', '+408970', 'captainhook99999@gmail.com', 2, 0, 0, NULL, NULL, NULL, NULL, '7682430b5b4b21a0f7be47a3ea44dc43', '0', NULL, '2018-06-07 11:30:05', '2018-10-15 07:10:00', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'WDUCAM7PJPUZMM5E', NULL, NULL, NULL, NULL, '0.0000000000', '', 1, 1, 'Los Angeles', 'California', 'USA', '', ''),
(133, '', '', 'leo', 'Google', 'leo1234567', '+40652230', 'leoruzin@hotmail.com', 2, 1, 0, NULL, '4a81c63779e946fc690c63e7e5804491', '2018-06-19 16:45:41', NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:10:09', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 'jdskalfajsdlkf', NULL, NULL, NULL, '0.0000000000', '', 0, 1, 'Chicago', ' Illinois', 'America', '', ''),
(148, '', '', '555', 'Facebook', 'bfa3df38a34c4dd8e5849718214ad87ba8f9df40549688c04b670ac5df7cfaae75ddf1bedf85f8e3e4bcb17eef306675ff411355976f207d3d8ebfdbbbfa8a40', '+4020404', '555@555.com', 2, 1, 0, NULL, '77b22ce6c80403d54615506663ca43e5', '2018-06-19 16:39:24', NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:10:18', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '555', NULL, NULL, NULL, '0.0000000000', '', 0, 0, '', '', '', '', ''),
(150, '', '', 'hehe', '', '26723846bc5a684b1aa1c6f6c4210d4d2f4f86eb0b65123984614450b7bbc7b29008bcbabdc2aa59c4fa2139a19e548c24a423958a2e422dc711c4886cd2d7ce', '+4023102', 'leoruzin@hotmail.com', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:10:28', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 'hehe', NULL, NULL, NULL, '0.0000000000', '', 1, 0, '', '', '', '', ''),
(151, '', '', 'hihi', 'Facebook', 'ed2db10339fbb7c33e15be47ef7630cb2be9c404d0a4172440963f6b73b712eeeabdcb12a029a2e466159ea1af6998632f381dbd2a156f1908727e9798b88ae5', '+4023133', 'leoruzin@hotmail.com', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:10:45', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 'hihi', NULL, NULL, NULL, '0.0000000000', '', 0, 1, '', '', '', '', ''),
(154, '', '', '333', '', 'b081299adffaca47d8ca0c8553322767a4666be907a34d25aa28632ac944b346eeb9c51887167384355eced1f6ece7061302fcf4d209fba595e84257e233fce5', '+405673', 'asdf@ee.com', 2, 0, 0, NULL, '52ad027c22d5bfac8b27c9d103f0a76d', '2018-06-20 09:35:40', NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:11:21', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '333', NULL, NULL, NULL, '0.0000000000', '', 1, 1, '', '', '', '', ''),
(159, '', '', 'aaa', '', '4690aca9192016ddbd1c10fcfb3fff25503288aa2aa726334e54f97058aaa174e594a294c63979d51ab879aa4ba08e8aedd9200743d5fd84ea9223dfab24bbce', '+406865', 'qqq@aaa.com', 2, 0, 0, NULL, 'e7c4d763d6dc44c13be90edee9b2904c', '2018-06-20 20:34:14', NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:11:33', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 'aaa', NULL, NULL, NULL, '0.0000000000', '', 0, 0, '', '', '', '', ''),
(160, '', '', '111', 'Google', 'a9ef0c895826da6a393abb5cdcbab89b33964983536fd5c0a6acd9578868989bf33fb51eff274c6cb241cfc22db4128235057f0bd710a13f2a755e57e63b5b35', '+4056506', 'yakobux123456@gmail.com', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:11:47', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '111', NULL, NULL, NULL, '0.0000000000', '', 0, 0, '', '', '', '', ''),
(161, '', '', '222', 'Facebook', '9e6a5a5fd6ffd32127845bfe94c44f2f58f348276f98ed2e5657e0822c006720362a406b077fbf773f161b97643eb9d39733eb8edd858a898bfd2fe75041db0f', '+40568583', '222@222.com', 2, -1, 0, NULL, '070fa57b15f83403f5c45682dee6efd4', '2018-06-21 00:36:00', NULL, NULL, NULL, NULL, NULL, '2018-10-15 07:11:59', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 'c2d7cf95645d33006175b78989035c7c9061d3f9', NULL, NULL, NULL, '0.0000000000', '', 0, 1, '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airdrop_submits`
--
ALTER TABLE `airdrop_submits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airdrop_transaction`
--
ALTER TABLE `airdrop_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airdrop_user_info`
--
ALTER TABLE `airdrop_user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_access_history`
--
ALTER TABLE `tbl_access_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_call_history`
--
ALTER TABLE `tbl_call_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_config`
--
ALTER TABLE `tbl_config`
  ADD PRIMARY KEY (`config_key`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_report`
--
ALTER TABLE `tbl_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airdrop_submits`
--
ALTER TABLE `airdrop_submits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `airdrop_transaction`
--
ALTER TABLE `airdrop_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `airdrop_user_info`
--
ALTER TABLE `airdrop_user_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_access_history`
--
ALTER TABLE `tbl_access_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_call_history`
--
ALTER TABLE `tbl_call_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_report`
--
ALTER TABLE `tbl_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
