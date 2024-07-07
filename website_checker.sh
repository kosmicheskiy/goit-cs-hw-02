# Оголошення масиву з URL-адресами
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Функція для перевірки доступності сайту
check_website_availability() {
    local url="$1"
    local response_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$response_code" -eq 200 ]; then
        echo "UP"
    else
        echo "DOWN"
    fi
}

log_file="website_status.log"

for site in "${websites[@]}"; do
    status=$(check_website_availability "$site")
    echo "$site is $status" >> "$log_file"
done

echo "Результати записані у файл $log_file"
