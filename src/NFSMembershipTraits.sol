// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract NFSMembershipTraits {
    function getBackground(uint256 _backgroundId)
        public
        pure
        returns (string memory)
    { 
        string[10] memory backgrounds = [
            "", // Index 0 is empty
            "#141D48", // Dark Blue
            "#6F2430", // Dark Red
            "#C4A484", // Pastel Brown
            "#433F71", // Dark Purple
            "#105544", // Dark Green
            "#A8B0B2", // Gray/Silver
            "#000000", // Black
            "#FFD700", // Gold
            "#ECE7E5" // Off White
        ];

        return backgrounds[_backgroundId];
    }

    function getDepartment(uint256 _departmentId)
        public
        pure
        returns (string memory)
    {
        string[5] memory departments = [
            "MACHINE LEARNING",
            "BLOCKCHAIN",
            "SOFTWARE DEVELOPMENT",
            "INTERNAL AFFAIRS",
            "EXTERNAL RELATIONS"
        ];

        return departments[_departmentId];
    }

    function getSubDepartment(uint256 _departmentId, uint256 _subDeptId)
        public
        pure
        returns (string memory)
    {
        // MACHINE LEARNING
        if (_departmentId == 0) {
            string[3] memory mlRoles = [
                "ANALYST (RESEARCH)",
                "ANALYST (PROJECT)",
                "ANALYST (ALGO TRADING)"
            ];

            return mlRoles[_subDeptId];
        }
        // BLOCKCHAIN
        else if (_departmentId == 1) {
            string[3] memory blockchainRoles = [
                "RESEARCH ANALYST",
                "COMMUNITY MANAGER",
                "BLOCKCHAIN DEVELOPER"
            ];

            return blockchainRoles[_subDeptId];
        }
        // SOFTWARE DEVELOPMENT
        else if (_departmentId == 2) {
            string[2] memory devRoles = ["UIUX DESIGNER", "SOFTWARE ENGINEER"];

            return devRoles[_subDeptId];
        }
        // INTERNAL AFFAIRS
        else if (_departmentId == 3) {
            string[5] memory internalRoles = [
                "PROJECT MANAGEMENT",
                "TALENT MANAGEMENT",
                "FINANCE",
                "COMMUNITY DEVELOPMENT",
                "PRODUCT MANAGER"
            ];

            return internalRoles[_subDeptId];
        }
        // EXTERNAL RELATIONS
        else if (_departmentId == 4) {
            string[2] memory externalRoles = ["PARTNERSHIP", "MARKETING"];

            return externalRoles[_subDeptId];
        }

        return "";
    }
}
