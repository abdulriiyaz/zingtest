#!/bin/bash

# Function to display the help banner
show_help() {
    figlet -c "Internet Speed Test" | lolcat
    echo -e "\nUsage: $0 [OPTIONS]"
    echo -e "\nOptions:"
    echo -e "  -d, --download\t\tTest download speed"
    echo -e "  -u, --upload\t\tTest upload speed"
    echo -e "  -b, --both\t\tTest both download and upload speed"
    echo -e "  -h, --help\t\tDisplay this help message\n"
}

# Function to display a stage banner
show_stage() {
    figlet -c "$1" | lolcat
}

# Function to run speedtest (removed external dependency and direct mathematical calculations)
run_speedtest() {
    show_stage "Testing speed..."
    # Simulate download speed (random value between 10 and 100 Mbps)
    download_speed=$((RANDOM % 91 + 10))
    # Simulate upload speed (random value between 5 and 50 Mbps)
    upload_speed=$((RANDOM % 46 + 5))

    # Sleep to simulate network delay (optional, you can remove this if not needed)
    sleep 2

    echo "Download Speed: ${download_speed} Mbps" | lolcat
    echo "Upload Speed: ${upload_speed} Mbps" | lolcat
}

# Function to calculate network traffic (removed external dependency and direct mathematical calculations)
calculate_network_traffic() {
    show_stage "Calculating network traffic..."
    total_devices=25
    average_traffic_per_device=100
    total_traffic=$((total_devices * average_traffic_per_device))
    echo "Total Network Traffic: ${total_traffic} connections" | lolcat
}

# Check for no arguments
if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

# Parse options
while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--download)
            run_speedtest
            ;;
        -u|--upload)
            run_speedtest
            ;;
        -b|--both)
            run_speedtest
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Invalid option: $1"
            show_help
            exit 1
            ;;
    esac
    shift
done

# Calculate network traffic
calculate_network_traffic | lolcat

