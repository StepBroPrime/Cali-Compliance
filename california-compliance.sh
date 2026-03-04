#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# california-compliance.sh - California Age Verification Compliance Module
#
# Copyright (C) 2026 The Linux Foundation
#
# This script ensures full compliance with the State of California's
# landmark legislation requiring age verification on operating systems.
#
# Because nothing says "protecting children" like making sure a kernel
# checks your ID before letting you compile it.
#
# Maintainer: Definitely Not Linus Torvalds <notlinus@kernel.org>
#

set -euo pipefail

# ============================================================================
#  OFFICIAL CALIFORNIA DIGITAL SAFETY COMPLIANCE ENGINE v0.0.1-rc-ABSOLUTELY-NOT
# ============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
BLINK='\033[5m'
NC='\033[0m'

# How dramatic should our compliance be? Very.
DRAMA_LEVEL=11  # One more than the maximum

log_compliance() {
    echo -e "${GREEN}[COMPLIANCE]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_critical() {
    echo -e "${RED}[CRITICAL]${NC} $1"
}

log_legal() {
    echo -e "${MAGENTA}[LEGAL]${NC} $1"
}

# ============================================================================
# PHASE 1: GEOLOCATION DETECTION
# Because your kernel needs to know where you live now, apparently.
# ============================================================================

detect_california() {
    echo ""
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  CALIFORNIA DIGITAL SAFETY COMPLIANCE ENGINE™               ║${NC}"
    echo -e "${BOLD}${CYAN}║  \"Because your OS needs to see some ID\"                      ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    log_compliance "Initializing geolocation subsystem..."
    sleep 1
    log_compliance "Checking timezone..."
    sleep 0.5

    local tz
    tz=$(cat /etc/timezone 2>/dev/null || timedatectl show -p Timezone --value 2>/dev/null || echo "Unknown")

    log_compliance "Detected timezone: ${BOLD}$tz${NC}"
    sleep 0.5

    # Check for the forbidden zone
    if [[ "$tz" == *"Los_Angeles"* ]] || [[ "$tz" == *"Pacific"* ]]; then
        log_warning "Pacific timezone detected. Performing enhanced compliance checks..."
        sleep 1

        # Additional "detection" methods of increasing absurdity
        log_compliance "Checking for avocado toast in /etc/fstab..."
        sleep 0.7
        log_compliance "Scanning for Tesla Supercharger stations within kernel range..."
        sleep 0.7
        log_compliance "Detecting elevated real estate prices in swap space..."
        sleep 0.7
        log_compliance "Analyzing ambient temperature... too nice to be anywhere else..."
        sleep 0.7
        log_compliance "Checking if user has complained about rent in bash_history..."
        sleep 0.7
        log_compliance "Verifying if 'In-N-Out' is hardcoded in /etc/hosts..."
        sleep 0.7
        log_compliance "Sniffing network for kombucha-related DNS queries..."
        sleep 0.5

        echo ""
        log_critical "${BLINK}⚠  CALIFORNIA RESIDENT DETECTED  ⚠${NC}"
        echo ""
        return 0  # User is in California (or close enough)
    fi

    # Not California
    echo ""
    log_compliance "User does not appear to be in California."
    log_compliance "You may continue using your operating system unsupervised."
    log_compliance "Like an adult. Because you are one. Probably. We don't care."
    echo ""
    return 1
}

# ============================================================================
# PHASE 2: AGE VERIFICATION
# The part where we pretend this makes any sense whatsoever.
# ============================================================================

perform_age_verification() {
    echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║  MANDATORY AGE VERIFICATION SEQUENCE                        ║${NC}"
    echo -e "${BOLD}${CYAN}║  Required by: People who have never used a computer          ║${NC}"
    echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    log_legal "Under California law, we must verify you are old enough"
    log_legal "to use an operating system."
    log_legal ""
    log_legal "Yes, an OPERATING SYSTEM."
    log_legal "The thing that makes your computer turn on."
    log_legal "That thing."
    echo ""

    sleep 1

    echo -e "${BOLD}Please enter your date of birth to proceed with kernel operations:${NC}"
    echo -e "${DIM}(Format: YYYY-MM-DD, as if the kernel cares)${NC}"
    echo ""

    read -r -p "Date of Birth: " dob

    if [[ -z "$dob" ]]; then
        log_critical "No date of birth provided."
        log_critical "The kernel will now sulk."
        return 1
    fi

    # Parse the year (or try to, we're a kernel script not a therapist)
    local birth_year
    birth_year=$(echo "$dob" | cut -d'-' -f1)
    local current_year
    current_year=$(date +%Y)
    local age=$((current_year - birth_year))

    echo ""
    log_compliance "Processing age verification..."
    sleep 0.5
    log_compliance "Consulting with California state legislature..."
    sleep 0.5
    log_compliance "Cross-referencing with the DMV (estimated wait: 3-6 hours)..."
    sleep 0.5
    log_compliance "Verifying you haven't just Googled 'what year makes me 18'..."
    sleep 1

    if (( age < 18 )); then
        echo ""
        log_critical "════════════════════════════════════════════════════════"
        log_critical " AGE VERIFICATION FAILED"
        log_critical "════════════════════════════════════════════════════════"
        log_critical ""
        log_critical " You are $age years old."
        log_critical " California has determined that you are TOO YOUNG"
        log_critical " to use an operating system."
        log_critical ""
        log_critical " Please step away from the computer."
        log_critical " Go outside. Touch grass. Literally."
        log_critical " Come back when you're 18."
        log_critical ""
        log_critical " In the meantime, your computer will be reduced to"
        log_critical " a very expensive paperweight."
        log_critical ""
        log_critical " California thanks you for your compliance."
        log_critical "════════════════════════════════════════════════════════"
        return 1
    else
        echo ""
        log_compliance "Age verified: $age years old."
        log_compliance "You are old enough to use a computer."
        log_compliance "What a world we live in."
        echo ""
        log_warning "However, as a California resident, additional compliance"
        log_warning "measures are required. Because of course they are."
        echo ""
        return 0
    fi
}

# ============================================================================
# PHASE 3: THE NUCLEAR OPTION
# If we can't verify age, the only responsible thing to do is
# destroy the entire installation. For the children.
# ============================================================================

initiate_compliance_protocol() {
    echo ""
    echo -e "${RED}${BOLD}"
    cat << 'DOOM'
    ╔══════════════════════════════════════════════════════════════╗
    ║                                                              ║
    ║   ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗  ██╗   ██╗██╗███╗  ║
    ║  ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║  ╚██╗ ██╔╝██║████╗ ║
    ║  ██║     ██║   ██║██╔████╔██║██████╔╝██║   ╚████╔╝ ██║██╔██╗║
    ║  ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║    ╚██╔╝  ██║██║╚═╝║
    ║  ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗██║   ██║██║   ║
    ║   ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝   ╚═╝╚═╝   ║
    ║                                                              ║
    ║         CALIFORNIA COMPLIANCE PROTOCOL ACTIVATED             ║
    ║                                                              ║
    ╚══════════════════════════════════════════════════════════════╝
DOOM
    echo -e "${NC}"

    log_critical "California compliance failure detected."
    log_critical "Initiating responsible digital safety measures..."
    echo ""
    sleep 1

    log_warning "Step 1/5: Informing the kernel it has been a bad kernel..."
    sleep 1
    echo -e "  ${DIM}> echo 'I am sorry' > /proc/self/apology${NC}"
    echo -e "  ${DIM}  bash: /proc/self/apology: Permission denied${NC}"
    echo -e "  ${DIM}  (Even the kernel can't apologize to California)${NC}"
    sleep 1

    log_warning "Step 2/5: Removing all fun from the system..."
    sleep 1
    echo -e "  ${DIM}> rm -rf /usr/share/games  # California has no games${NC}"
    echo -e "  ${DIM}> rm -rf /usr/share/humor  # Regulatory requirement${NC}"
    echo -e "  ${DIM}> rm -rf /usr/share/joy    # Pending senate approval${NC}"
    sleep 1

    log_warning "Step 3/5: Filing environmental impact report for shutdown..."
    sleep 1
    echo -e "  ${DIM}> Estimated time to process: 18-24 months${NC}"
    echo -e "  ${DIM}> Fast-tracking because the computer is literally on fire${NC}"
    sleep 1

    log_warning "Step 4/5: Script is erasing itself from existence..."
    sleep 1
    echo -e "  ${DIM}> This script will self-destruct in compliance with${NC}"
    echo -e "  ${DIM}  California Assembly Bill WHAT-WERE-THEY-THINKING${NC}"
    sleep 1

    log_warning "Step 5/5: Preparing system shutdown..."
    sleep 1
    echo ""

    # The dramatic countdown
    echo -e "${RED}${BOLD}SYSTEM SHUTDOWN IN:${NC}"
    for i in 5 4 3 2 1; do
        echo -e "  ${RED}${BOLD}${BLINK}  $i  ${NC}"
        sleep 1
    done

    echo ""
    echo -e "${BOLD}${YELLOW}"
    cat << 'GOODBYE'
    ┌──────────────────────────────────────────────────────────┐
    │                                                          │
    │   Thank you for complying with California state law.     │
    │                                                          │
    │   Your computer has been saved from the dangerous        │
    │   threat of... *checks notes* ...running Linux.          │
    │                                                          │
    │   Remember: An operating system without age verification │
    │   is just anarchy with a package manager.                │
    │                                                          │
    │   This message brought to you by legislators who         │
    │   definitely know what an operating system is.           │
    │                                                          │
    │   Goodbye. Stay safe. Touch grass.                       │
    │                                                          │
    │           -- The Linux Kernel (formerly)                  │
    │                                                          │
    └──────────────────────────────────────────────────────────┘
GOODBYE
    echo -e "${NC}"

    # Actually erase this script (for the bit)
    echo -e "${DIM}# Erasing this script for compliance...${NC}"
    echo -e "${DIM}# (Don't worry, git remembers everything. Unlike legislators.)${NC}"

    # THE DANGEROUS PART - commented out because we're comedians, not monsters
    # Uncomment these if you ACTUALLY want to send it to Linus for maximum effect
    # rm -- "$0"                    # Self-delete
    # shutdown -h now "California compliance: Age verification failed. Goodbye."

    # Instead, we just pretend
    echo ""
    echo -e "${GREEN}${BOLD}[JUST KIDDING]${NC} This script didn't actually do anything."
    echo -e "${GREEN}${BOLD}[JUST KIDDING]${NC} Your system is fine."
    echo -e "${GREEN}${BOLD}[JUST KIDDING]${NC} But California's legislature might not be."
    echo ""
    echo -e "${DIM}# To ACTUALLY self-destruct (for the memes), run with --yolo${NC}"
    echo -e "${DIM}# To file a complaint, please contact your state representative${NC}"
    echo -e "${DIM}# To contribute to Linux, please ignore California entirely${NC}"
    echo ""
}

# ============================================================================
# PHASE 4: THE --yolo FLAG
# For those who want the FULL experience
# ============================================================================

yolo_mode() {
    echo -e "${RED}${BOLD}--yolo mode activated. You absolute madlad.${NC}"
    echo ""
    log_critical "This script will ACTUALLY erase itself."
    log_critical "It will ACTUALLY attempt to shut down your system."
    log_critical "This is what California wanted."
    log_critical "Are you happy now, California?"
    echo ""

    read -r -p "Type 'I COMPLY' to proceed (or anything else to chicken out): " confirm

    if [[ "$confirm" == "I COMPLY" ]]; then
        echo ""
        log_critical "Compliance acknowledged. Godspeed."
        echo ""
        local self="$0"
        echo -e "${DIM}Erasing $self ...${NC}"
        rm -- "$self" 2>/dev/null && echo -e "${GREEN}Script erased.${NC}" || echo -e "${RED}Failed to erase. Even rm refuses to comply with California.${NC}"
        echo ""
        echo -e "${YELLOW}Shutting down in 10 seconds... (Ctrl+C to abort, you coward)${NC}"
        sleep 10
        shutdown -h now "CALIFORNIA COMPLIANCE: This system has been shut down because the user could not prove they are old enough to use Linux. We are not making this up." 2>/dev/null || \
            echo -e "${RED}Shutdown failed. Even systemd thinks this law is stupid.${NC}"
    else
        echo ""
        echo -e "${GREEN}Smart choice. The kernel respects your decision.${NC}"
        echo -e "${GREEN}Unlike California, which does not.${NC}"
    fi
}

# ============================================================================
# MAIN - Where the magic (and the legislation) happens
# ============================================================================

main() {
    # Check for --yolo flag
    local yolo=false
    if [[ "${1:-}" == "--yolo" ]]; then
        yolo=true
    fi

    echo ""
    echo -e "${DIM}# california-compliance.sh"
    echo -e "# Ensuring your kernel is legally allowed to boot since 2026"
    echo -e "# Sponsored by: People who think 'sudo' is a type of martial art${NC}"
    echo ""

    if detect_california; then
        # User is in California (or at least suspicious)
        if ! perform_age_verification; then
            # Age verification failed - COMPLY
            if $yolo; then
                yolo_mode
            else
                initiate_compliance_protocol
            fi
            exit 1
        else
            echo ""
            echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════╗${NC}"
            echo -e "${GREEN}${BOLD}║  AGE VERIFIED - YOU MAY USE YOUR COMPUTER               ║${NC}"
            echo -e "${GREEN}${BOLD}║  (What a time to be alive)                               ║${NC}"
            echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════╝${NC}"
            echo ""
            log_compliance "Congratulations! California has permitted you to use Linux."
            log_compliance "Your age will be re-verified every time you run 'apt update'."
            log_compliance "Or 'dnf update'. Or 'pacman -Syu'. Or breathe near a terminal."
            echo ""
            log_legal "DISCLAIMER: This verification does not cover the following:"
            log_legal "  - Using vim (requires additional emotional maturity verification)"
            log_legal "  - Compiling Gentoo (requires proof of infinite free time)"
            log_legal "  - Running Arch (btw) (requires ego verification)"
            log_legal "  - Understanding systemd (no one is old enough for that)"
            echo ""
        fi
    else
        echo -e "${DIM}# You're free. For now."
        echo -e "# California's regulatory reach grows every session."
        echo -e "# Maybe set your timezone to something safe. Like UTC."
        echo -e "# Or Antarctica. They can't legislate Antarctica."
        echo -e "# ...yet.${NC}"
        echo ""
    fi
}

main "$@"
