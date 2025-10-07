use std::{thread, time};
struct Generator {
	name: String,
	income_per_tick: f64,
}
fn main() {
	let mut crabs: f64 = 0.0;
	let generator = Generator {
		name: String::from("Basic Shovel"),
		income_per_tick: 1.0,
	};
	let tick_duration = time::Duration::from_secs(1);
	println!("Welcome to Bucket-o-Crabs!");
	println!("\tPress Ctrl+C to quit.");
	loop {
		crabs += generator.income_per_tick;
		println!("The Bucket has {:.0} Crabs", crabs);
		println!(
			"\t{}:\n\t\t+{:.0}",
			generator.name, generator.income_per_tick
		);
		thread::sleep(tick_duration);
	}
}
