#!/bin/bash

disk_space() {
    echo "Disk Space Usage:"
    df -h | awk '{print $4}'
}

cpu_usage() {
    echo "Top 10 Processes by CPU Usage:"
    ps -eo user,pid,%cpu --sort=-%cpu | head -n 10
}

mem_usage() {
    echo "Top 10 Processes by Memory Usage:"
    ps -eo user,pid,%mem --sort=-%mem | head -n 10
}

show_help() {
    echo "Usage:"
    echo "  $0 -d, --disk    Show disk space usage"
    echo "  $0 -c, --cpu     Show top 10 processes by CPU usage"
    echo "  $0 -m, --mem     Show top 10 processes by memory usage"
    echo "  $0 --help        Show this help message"
    echo ""
    echo "Press 1 to show disk space"
    echo "Press 2 to print top 10 CPU processes"
    echo "Press 3 to print top 10 memory processes"
}

main_loop() {
    while true; do
        echo ""
        echo "Select an option:"
        echo "1. Disk Space"
        echo "2. Top 10 Processes by CPU Usage"
        echo "3. Top 10 Processes by Memory Usage"
        echo "4. Exit"
        read -p "Enter your choice: " choice

        case "$choice" in
            1)
                disk_space
                ;;
            2)
                cpu_usage
                ;;
            3)
                mem_usage
                ;;
            4)
                exit 0
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

if [ $# -eq 0 ]; then
    main_loop
else
    case "$1" in
        -d|--disk)
            disk_space
            ;;
        -c|--cpu)
            cpu_usage
            ;;
        -m|--mem)
            mem_usage
            ;;
        --help)
            show_help
            ;;
        *)
            echo "Invalid option. Use --help for usage information."
            exit 1
            ;;
    esac
fi
