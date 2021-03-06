CREATE DATABASE IF NOT EXISTS `tournaments` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tournaments`;

CREATE TABLE IF NOT EXISTS `bracket` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(10) NOT NULL,
  `round` int(2) NOT NULL,
  `child_bracket_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bracket_matches` (
  `bracket_id` int(10) NOT NULL,
  `match_id` int(11) NOT NULL,
  PRIMARY KEY (`bracket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `bracket_players` (
  `bracket_id` int(10) NOT NULL,
  `player_id` int(10) NOT NULL,
  `score` int(1) NOT NULL DEFAULT '-1',
  `win` int(1) NOT NULL DEFAULT '-1',
  UNIQUE KEY `bracket_id` (`bracket_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `bracket_rounds` (
  `tournament_id` int(10) NOT NULL,
  `round_nr` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`tournament_id`,`round_nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  `type` int(1) NOT NULL,
  `allday` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `deck_settings` (
  `tournament_id` int(10) NOT NULL,
  `decks_required` int(1) NOT NULL DEFAULT '0',
  `sideboard_size` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `invites` (
  `tournament_id` int(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`tournament_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `roles` (
  `tournament_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tournament_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tournaments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `url` varchar(50) NOT NULL,
  `date` int(10) NOT NULL,
  `regstate` int(1) NOT NULL DEFAULT '0',
  `tournamenttype` int(1) NOT NULL,
  `tournamentstate` int(1) NOT NULL DEFAULT '0',
  `visibility` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tournament_decks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `deck` varchar(500) NOT NULL,
  `is_sideboard` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tournament_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `line` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tournament_players` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(10) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tournament_id` (`tournament_id`,`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `ingamename` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
