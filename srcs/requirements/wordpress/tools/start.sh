#!/bin/sh

exit_if_fail() {
	if [ $? -gt 0 ]; then
		echo "[ERROR] $1"
		exit 1
	fi
}

check_db () {
	wp db check > /dev/null 2>&1
	exit_if_fail "db connection failed!"
	echo "[INFO] db connection success"
}

run_install () {
	echo "[INFO] Create wordpress config"
	wp config create \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=$SQL_HOST
	
	check_db;

	echo "[INFO] Install and create admin user"
	wp core install \
		--url=$WP_URL \
		--title="$WP_TITLE" \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASSWD \
		--admin_email=$WP_ADMIN_EMAIL
	exit_if_fail "WP install failed!";

	echo "[INFO] Create $WP_USER_NAME user"
	wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" \
		--user_pass="$WP_USER_PASSWD" \
		--display_name="$WP_USER_DISPLAY_NAME"
	exit_if_fail "Failed to create $WP_USER_NAME!";
	echo "[INFO] End Install"
}

wp config path > /dev/null 2>&1
if [ $? -eq 0 ]; then
	check_db;
else
	run_install;
fi

php-fpm7.3 -F