# OnYouFit (Mission Statement)
## **Driving the world’s transition to a fully decentralized digital personalized lifestyle**
	
**OnYouFit (Vision)** - To become the first e-Commerce Tech Lifestyle Social & Business Decentralized Ecosystem with a mobile-first philosophy of the 21st century by driving the world’s transition to a digital decentralized and personalized lifestyle. The centralization of wealth due to large, centralized corporations is growing at high speed increasing the gap with small artisans and businesses that are struggling to survive. The world is moving towards a complete personalized experience in their day-to-day life. People desire to experience the same human touch, even though digital means. Online and physical businesses need to develop new strategies to acquire customers and modify their business model to keep afloat. The recent technological advancement provides us with new opportunities to overcome the challenges related to distance or lack of physical presence. The technology offered the opportunity to local businesses to become global and remotely located clients to purchase their desired products from anywhere in the world without being physically present. OnYouFit focuses on a lifestyle-related product that can range from clothing, accessories to even vehicles new and used and more.	OnYouFit will provide the users with the instruments to purchase products from designer, retail shops from anywhere in the world in the comfort of their home. The distance is not anymore a challenge! With OnYouFit, it becomes an opportunity! A shared wealth through our decentralized protocol solution! We grow and everyone earn!	We are transforming a challenge into a new business opportunity by leveraging the most recent technological advancements in the field of Artificial Intelligence (AI), Augmented Reality (AR), Virtual Reality (VR), Polkadot blockchain and Decentralized Finance (Defi).	Polkadot will offer us the opportunity to leverage the advancement cross chain capabilities allowing the ecosystem to scale and to provide the users DeFi / blockchain products. \
The initial use of Polkadot is to have a dedicated parachain/substrate, with a basic utility token that will be used in our first MVP launch with the mobile app (android and iphone) that is currently in development. Users of OnYouFit will be blockchain agnostic, in the sense we will make sure that the word blockchain does not scared the platfrom users and does not scare less savy business to jump on the platform. Each account will have its own wallet that initially will be generated on the backend without the user even know there is a wallet on their account. Cross country payment will be all handled by the ecosystem on polkadot and FIAT will be all translated into Onyoufit token that will then moved across the OnyouFit business across the globe. The architecture will allow us to avoid FIAT currencies exchanges, where the FIAT will be then managed centrally by a treasury team/trader. The above approach will allow us to reduce costs on transaction and in addition slowly introcude other DeFi products offered either through pokadot ecosystem or we will create our own. For example Defi loans to pay for purchased products with zero interest rate on the blockchain etc. We are well aware that to realise our vision we will need many resources and support from the Polkadot community especially in developing the decentralized protocol that will manage the reward system, voting and the creation of OnYouFit Foundation that should be very similar to the way Polkadot is run voting today. We are excited in our journey and we hope while we have built our first substrate to enhance and develop further our capabilies. Our project needs visibility and fully decentralized community to be able to realise our Vision. Our founders are keen to work with anyone that is excited as we are to bring this vision to a reality.


## **Updates:**

### Added OnYouFit contract (Solidity) that allows:

- Registering  of Products and Services
- Mark Product/Service as Inactive, can be coded in the frontend to have the product removed from catalouge
- Buy service/product and transfer Utility Token keep details stored on the blockchain. 🚀:

### Rust Setup

First, complete the [basic Rust setup instructions](./docs/rust-setup.md).

### Run

Use Rust's native `cargo` command to build and launch the template node:

```sh
cargo run --release -- --dev --tmp
```

### Build

The `cargo run` command will perform an initial build. Use the following command to build the node
without launching it:

```sh
cargo build --release
```

### Embedded Docs

Once the project has been built, the following command can be used to explore all parameters and
subcommands:

```sh
./target/release/node-template -h
```

## Run

The provided `cargo run` command will launch a temporary node and its state will be discarded after
you terminate the process. After the project has been built, there are other ways to launch the
node.

### Single-Node Development Chain

This command will start the single-node development chain with persistent state:

```bash
./target/release/node-template --dev
```

Purge the development chain's state:

```bash
./target/release/node-template purge-chain --dev
```

Start the development chain with detailed logging:

```bash
RUST_LOG=debug RUST_BACKTRACE=1 ./target/release/node-template -lruntime=debug --dev
```

### Connect with Polkadot-JS Apps Front-end

Once the node template is running locally, you can connect it with **Polkadot-JS Apps** front-end
to interact with your chain. [Click here](https://polkadot.js.org/apps/#/explorer?rpc=ws://localhost:9944) connecting the Apps to your local node template.

### Multi-Node Local Testnet

If you want to see the multi-node consensus algorithm in action, refer to
[our Start a Private Network tutorial](https://substrate.dev/docs/en/tutorials/start-a-private-network/).

## Template Structure

A Substrate project such as this consists of a number of components that are spread across a few
directories.

### Node

A blockchain node is an application that allows users to participate in a blockchain network.
Substrate-based blockchain nodes expose a number of capabilities:

-   Networking: Substrate nodes use the [`libp2p`](https://libp2p.io/) networking stack to allow the
    nodes in the network to communicate with one another.
-   Consensus: Blockchains must have a way to come to
    [consensus](https://substrate.dev/docs/en/knowledgebase/advanced/consensus) on the state of the
    network. Substrate makes it possible to supply custom consensus engines and also ships with
    several consensus mechanisms that have been built on top of
    [Web3 Foundation research](https://research.web3.foundation/en/latest/polkadot/NPoS/index.html).
-   RPC Server: A remote procedure call (RPC) server is used to interact with Substrate nodes.

There are several files in the `node` directory - take special note of the following:

-   [`chain_spec.rs`](./node/src/chain_spec.rs): A
    [chain specification](https://substrate.dev/docs/en/knowledgebase/integrate/chain-spec) is a
    source code file that defines a Substrate chain's initial (genesis) state. Chain specifications
    are useful for development and testing, and critical when architecting the launch of a
    production chain. Take note of the `development_config` and `testnet_genesis` functions, which
    are used to define the genesis state for the local development chain configuration. These
    functions identify some
    [well-known accounts](https://substrate.dev/docs/en/knowledgebase/integrate/subkey#well-known-keys)
    and use them to configure the blockchain's initial state.
-   [`service.rs`](./node/src/service.rs): This file defines the node implementation. Take note of
    the libraries that this file imports and the names of the functions it invokes. In particular,
    there are references to consensus-related topics, such as the
    [longest chain rule](https://substrate.dev/docs/en/knowledgebase/advanced/consensus#longest-chain-rule),
    the [Aura](https://substrate.dev/docs/en/knowledgebase/advanced/consensus#aura) block authoring
    mechanism and the
    [GRANDPA](https://substrate.dev/docs/en/knowledgebase/advanced/consensus#grandpa) finality
    gadget.

After the node has been [built](#build), refer to the embedded documentation to learn more about the
capabilities and configuration parameters that it exposes:

```shell
./target/release/node-template --help
```

### Runtime

In Substrate, the terms
"[runtime](https://substrate.dev/docs/en/knowledgebase/getting-started/glossary#runtime)" and
"[state transition function](https://substrate.dev/docs/en/knowledgebase/getting-started/glossary#stf-state-transition-function)"
are analogous - they refer to the core logic of the blockchain that is responsible for validating
blocks and executing the state changes they define. The Substrate project in this repository uses
the [FRAME](https://substrate.dev/docs/en/knowledgebase/runtime/frame) framework to construct a
blockchain runtime. FRAME allows runtime developers to declare domain-specific logic in modules
called "pallets". At the heart of FRAME is a helpful
[macro language](https://substrate.dev/docs/en/knowledgebase/runtime/macros) that makes it easy to
create pallets and flexibly compose them to create blockchains that can address
[a variety of needs](https://www.substrate.io/substrate-users/).

Review the [FRAME runtime implementation](./runtime/src/lib.rs) included in this template and note
the following:

-   This file configures several pallets to include in the runtime. Each pallet configuration is
    defined by a code block that begins with `impl $PALLET_NAME::Config for Runtime`.
-   The pallets are composed into a single runtime by way of the
    [`construct_runtime!`](https://crates.parity.io/frame_support/macro.construct_runtime.html)
    macro, which is part of the core
    [FRAME Support](https://substrate.dev/docs/en/knowledgebase/runtime/frame#support-library)
    library.

### Pallets

The runtime in this project is constructed using many FRAME pallets that ship with the
[core Substrate repository](https://github.com/paritytech/substrate/tree/master/frame) and a
template pallet that is [defined in the `pallets`](./pallets/template/src/lib.rs) directory.

A FRAME pallet is compromised of a number of blockchain primitives:

-   Storage: FRAME defines a rich set of powerful
    [storage abstractions](https://substrate.dev/docs/en/knowledgebase/runtime/storage) that makes
    it easy to use Substrate's efficient key-value database to manage the evolving state of a
    blockchain.
-   Dispatchables: FRAME pallets define special types of functions that can be invoked (dispatched)
    from outside of the runtime in order to update its state.
-   Events: Substrate uses [events](https://substrate.dev/docs/en/knowledgebase/runtime/events) to
    notify users of important changes in the runtime.
-   Errors: When a dispatchable fails, it returns an error.
-   Config: The `Config` configuration interface is used to define the types and parameters upon
    which a FRAME pallet depends.

### Run in Docker

First, install [Docker](https://docs.docker.com/get-docker/) and
[Docker Compose](https://docs.docker.com/compose/install/).

Then run the following command to start a single node development chain.

```bash
./scripts/docker_run.sh
```

This command will firstly compile your code, and then start a local development network. You can
also replace the default command (`cargo build --release && ./target/release/node-template --dev --ws-external`)
by appending your own. A few useful ones are as follow.

```bash
# Run Substrate node without re-compiling
./scripts/docker_run.sh ./target/release/node-template --dev --ws-external

# Purge the local dev chain
./scripts/docker_run.sh ./target/release/node-template purge-chain --dev

# Check whether the code is compilable
./scripts/docker_run.sh cargo check
```
