# DD-IX Peering and Joining Policy


## Purpose

This policy governs the conditions and guidelines for peering at DD-IX.


## Introduction

DD-IX is the internet exchange point for Dresden and all of Saxony. As a
non-commercial and open platform, we are available to all organizations
and providers for multilateral exchange of internet traffic.

The IXP is operated by passionately committed people within the DD-IX e.V.
The DD-IX e.V. is a registered association under German law.


## Requirements

Despite the fact that we have an open policy, each peer must permanently meet
the following requirements for participation:

- peers must be legal entities
- peers must only engage in legal activities that comply with German jurisdiction
- peers are responsible for fulfilling the technical requirements for participation


## Peering Application

The following information must be provided for a peering application:

- the completed peering application form
- acceptance of this policy
- acceptance of the payment terms
- proof of legal existence


## Peering Costs

The recurring costs of a peer result from the booked network ports and
the value-added services at the IXP.

Peers are required to pay the peering costs according to the agreed payment
terms. Outstanding payments may result in suspension or termination of peering
ports at the discretion of the DD-IX.


## Responsibilities and Guarantees

DD-IX provides a platform for exchanging network traffic, with peers responsible for:

- their own routing and peering agreements with other peers
- establish a optimal route selection and efficiently traffic routing
- peering with the DD-IX route servers
- security and integrity of their AS

DD-IX is operated with a lot of commitment for a continuous and trouble-free operation.
However, as a non-commercial platform, no legal guarantee for service levels can be given.


## Suspension and Termination

In case of important reasons, the DD-IX can suspense or terminate peering ports
at any time for the following important reasons:

- for security and stability reasons
- violation of the peering requirements
- repeatedly outstanding payments

A peer may terminate its participation at any time. A refund of peering costs is generally excluded.


## Technical Requirements

In addition to the legal requirements for participation, the following
technical requirements must also be met by each peer:

- peers require to have a physical connection to one of DD-IX point of presence
- only a single static MAC-address is allowed to be used on a peering port (single port or LAG)
- peers must never route the peering prefix via IGP nor EGP
- peers are only allowed to use assigned L3 addresses on the peering broadcast domain
- peers must be authorized to announce at least one DFZ routable prefix that comply
  with the filters of the DD-IX router servers
- peers must maintain IRRDB records
- peers are encouraged to maintain a PeeringDB record
- peers are encouraged to peer with the DD-IX router servers
- peers are encouraged to apply strict router filters


## Router Servers

Two distributed router servers are available in the peering broadcast domain.
All peers are encouraged to setup peering sessions to the route servers and
announce their prefixes for a optimal meshing to the other peers.


## Private Network Interconnect

Peers can book PNIs as value-added services for a private broadcast domain
between two network ports at any DD-IX point of presence under the following
conditions:

- PNIs are setup between two network ports using 802.1Q tagging
- only a single static MAC-address per 802.1Q tag is allowed to be used on a port 
- peers agree on their own routing and peering policy


## Consulting

Interested peers can get free consulting to connect to DD-IX. We support you
in your search for the optimal connection option and put you in contact
to carriers and data center operators.
