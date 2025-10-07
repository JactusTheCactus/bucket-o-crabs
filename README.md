<style>
	body {
		font: 20pt "Noto Sans"
	}
	code {
		font-family: "Noto Sans Mono"
	}
</style>
# **Rust Idle Game Learning Roadmap**
## **Phase 1 – Rust Basics (Console)**
**Goal:** Get comfortable with Rust syntax, types, and the compiler.
* **Setup:** Install Rust via `rustup`, set up `cargo` (Rust’s package manager).
* **Tasks:**
  1. Hello world.
  2. Variables, mutability, constants.
  3. Basic types: integers (`i32`, `u32`), floats (`f64`), bool, string slices (`&str`) vs `String`.
  4. Control flow: `if`, `match`, loops (`for`, `while`).
  5. Functions and returning values.
  6. Structs: model a simple “building” or “upgrade”.
  7. Vectors: store multiple buildings/upgrades.

**Mini Project:**
* Write a console version of a clicker:
  * One resource (e.g., coins).
  * A single upgrade that multiplies income.
  * Print the current amount every “tick” (loop with a `sleep`).
## **Phase 2 – Ownership, Borrowing, and Rust Idioms**
**Goal:** Learn Rust’s core safety features through practical coding.
* **Topics:**
  1. Ownership rules: who owns data?
  2. Borrowing (`&`) and mutable borrowing (`&mut`).
  3. References vs moving data.
  4. Option and Result types (`Some`, `None`, `Ok`, `Err`) for safe operations.
* **Mini Project:**
  * Expand the console clicker to multiple resource types or multiple building types.
  * Use structs + vectors + borrowing to handle updates safely.
  * Add “save/load” functionality (serialize struct to JSON using `serde`).
## **Phase 3 – Introduction to Bevy**
**Goal:** Start using Bevy ECS and move your game from console to a visual environment.

* **Setup:** Install Bevy, create a simple Bevy project.
* **Tasks:**
  1. Learn Bevy basics: App, Commands, Systems, Components.
  2. Create a simple window and draw shapes/text.
  3. Model your idle game entities as components:
     * `Resource { amount: f64 }`
     * `Generator { income_per_sec: f64 }`
  4. Write a system that updates resources every tick.

**Mini Project:**
* Visualize resources on screen (just text is fine).
* Clicking a button increases a resource (use Bevy’s UI nodes).
* Add one auto-generator that produces resources over time.
## **Phase 4 – Intermediate Bevy / UI**
**Goal:** Polish the game mechanics and UI.

* **Tasks:**
  1. Add multiple generators and upgrades.
  2. Implement buttons for buying upgrades (Bevy UI events).
  3. Add persistent saving/loading of game state.
  4. Display stats nicely (text, maybe basic 2D sprites).
  5. Use timers for passive income instead of looping.

**Mini Project:**
* Fully working idle game with:
  * Clicker mechanic.
  * Multiple auto-generators.
  * Upgrade system.
  * Resource display + saving/loading.
---
## **Phase 5 – Optional Enhancements**
* Polish visuals (sprites, animations).
* Add audio.
* Export to web using WebAssembly (WASM).
* Add achievements or milestones.
## **Tips for Learning Rust via this Project**
* **Embrace compiler errors:** They’re your friend. Rust is strict, but it will guide you to safe code.
* **Start small:** Build a console version first before diving into Bevy UI.
* **Use `cargo fmt` and `cargo clippy`:** Keeps your code neat and idiomatic.
* **Iterate:** Each phase adds one “layer” of complexity.
