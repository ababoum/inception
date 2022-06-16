<?php
 define('WP_CACHE', true);
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */
// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wp_inception' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'mababou' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', '42school42school' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'mariadb:3306' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'WP_CACHE_KEY_SALT','mababou.42.fr');
define( 'AUTH_KEY',         ' U7 B*K#HlPRZM|]Vg%=w3:[1.zT|jyp**&sM.2zitsX@RUzHB3S<C=|oR2)ZYRI' );
define( 'SECURE_AUTH_KEY',  'B~wc]}jeh#9.tTQ6R?<6H3kB+&1?p^QM&xGp[1&jEM^4gf f@Lo 2}JcLY?=MiUC' );
define( 'LOGGED_IN_KEY',    'sTPJ.%KJ4C!<17A6YXvF%T>G4k1@?:rI<r>^G@{9Byctc;Nk[M<q-iS]xl36qVC|' );
define( 'NONCE_KEY',        '42M@K]ao3TJo,]n0n1E]8x2Ts{()4$CndXee06erAZxV (h!OoGfd_5O[QH+D:jJ' );
define( 'AUTH_SALT',        '~_9A&?T3nLxED{U-)bcqkW9<6=#`Kml+{i?nodIKcu;bh8e:Iba[ix-R6FOP#T5|' );
define( 'SECURE_AUTH_SALT', 's6G*_sE:g~h)K~%nt>m72K#952X,<u9C }XEX6yS|~l 8>qL !AR5u)6;^_,bd1q' );
define( 'LOGGED_IN_SALT',   ';6Ks.+Vg3|v(Tc{kQ>q} 4t:DWW;|P0m$3%aE?t3VV3<>hU/?DpUlpS/`@3@u?`T' );
define( 'NONCE_SALT',       'TSWCcL@GZP8F2/<4XUBMr#N ..0YFXG5JVHSVes1~Dfedz=<<L 4kx3Mo#[g%v;.' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
