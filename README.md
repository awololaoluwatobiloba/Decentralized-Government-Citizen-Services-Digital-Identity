# Decentralized Government Citizen Services Digital Identity

A blockchain-based digital identity system for government services built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a secure, transparent, and privacy-focused approach to managing citizen digital identities and government service access. It consists of five interconnected smart contracts that work together to provide comprehensive identity management.

## Architecture

### Core Contracts

1. **Identity Manager Contract** (`identity-manager.clar`)
    - Validates and manages government identity managers
    - Controls who can register citizens and verify documents
    - Maintains manager authorization and status

2. **Citizen Registration Contract** (`citizen-registration.clar`)
    - Manages citizen registrations and basic identity verification
    - Stores hashed personal information for privacy
    - Tracks verification levels for service access

3. **Service Access Contract** (`service-access.clar`)
    - Controls access to government services
    - Enforces verification level requirements
    - Logs all service access attempts

4. **Document Verification Contract** (`document-verification.clar`)
    - Verifies and manages citizen documents
    - Supports various document types (passport, driver's license, etc.)
    - Handles document expiration and revocation

5. **Privacy Protection Contract** (`privacy-protection.clar`)
    - Manages citizen privacy settings
    - Controls data access permissions
    - Maintains audit trails for data access

## Features

- **Decentralized Identity Management**: No single point of failure
- **Privacy-First Design**: Personal data is hashed and stored securely
- **Granular Access Control**: Citizens control who accesses their data
- **Audit Trail**: Complete transparency of all data access
- **Verification Levels**: Tiered access based on identity verification
- **Document Management**: Secure verification and management of official documents

## Getting Started

### Prerequisites

- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm (for testing)

### Installation

1. Clone the repository
2. Install dependencies: `npm install`
3. Run tests: `npm test`

### Deployment

Deploy contracts in the following order:
1. `identity-manager.clar`
2. `citizen-registration.clar`
3. `service-access.clar`
4. `document-verification.clar`
5. `privacy-protection.clar`

## Usage

### For Government Administrators

1. **Add Identity Manager**:
   ```clarity
   (contract-call? .identity-manager add-identity-manager 
     'SP1234... "John Doe" "Department of Motor Vehicles")
   \`\`\`

2. **Create Government Service**:
   ```clarity
   (contract-call? .service-access create-service 
     "drivers-license-renewal" "Driver's License Renewal" u2)
   \`\`\`

### For Citizens

1. **Set Privacy Settings**:
   ```clarity
   (contract-call? .privacy-protection set-privacy-settings u2 false true)
   \`\`\`

2. **Request Service Access**:
   ```clarity
   (contract-call? .service-access request-service-access "drivers-license-renewal")
   \`\`\`

## Security Considerations

- All personal data is stored as hashes to protect privacy
- Multi-level verification system prevents unauthorized access
- Comprehensive audit logging for transparency
- Decentralized architecture eliminates single points of failure

## Testing

Run the test suite:
\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Identity manager operations
- Citizen registration flows
- Service access control
- Document verification
- Privacy protection features

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue in the GitHub repository.
\`\`\`

PR details file:
