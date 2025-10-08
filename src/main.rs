use crossterm::{
	cursor,
	event::{self, Event, KeyCode},
	execute,
	terminal::{self, enable_raw_mode, ClearType},
};
use std::{
	io::{self},
	thread, time,
};
struct State {
	bank: f64,
	price: f64,
}
struct Collector {
	name: String,
	rate: f64,
	lvl: f64,
}
struct Bucket {
	size: f64,
	crabs: f64,
}
fn main() {
	let tick = time::Duration::from_secs(1);
	let mut state = State {
		bank: 0.0,
		price: 1.0,
	};
	let mut bucket = Bucket {
		size: 100.0,
		crabs: 0.0,
	};
	let mut collectors = [
		Collector {
			name: String::from("Basic Shovel"),
			rate: 1.0,
			lvl: 1.0,
		},
		Collector {
			name: String::from("Basic Snow-Shovel"),
			rate: 2.0,
			lvl: 1.0,
		},
	];
	let mut full = false;
	let refresh = || {
		if true {
			/* boolean toggle for easy debugging */
			execute!(
				io::stdout(),
				terminal::Clear(ClearType::All),
				cursor::MoveTo(0, 0)
			)
			.unwrap()
		}
	};
	enable_raw_mode().expect("Failed to enter raw mode");
	refresh();
	println!("\rWelcome to Bucket-o-Crabs!");
	println!("\r\t1. Press [SPACE] to empty the bucket");
	println!(
		"\r\t2. Press [1-{}] to upgrade collectors",
		collectors.len()
	);
	println!("\r\t3. Press Ctrl+C to quit");
	thread::sleep(time::Duration::from_secs(10));
	loop {
		refresh();
		if event::poll(time::Duration::from_millis(10)).unwrap() {
			if let Event::Key(key_event) = event::read().unwrap() {
				if key_event.code == KeyCode::Char(' ') {
					let haul = bucket.crabs * state.price;
					println!("\rBucket Emptied!");
					println!("\r\tYou earned ${}", haul);
					println!();
					state.bank += haul;
					bucket.crabs = 0.0;
					full = false
				}
			}
		}
		println!(
			"\rCrabs: {:.0}/{:.0} ({:.2}%)",
			bucket.crabs,
			bucket.size,
			(bucket.crabs / bucket.size) * 100.0
		);
		println!("\r${}", state.bank);
		if !full {
			if event::poll(time::Duration::from_millis(10)).unwrap() {
				if let Event::Key(key_event) = event::read().unwrap() {
					for (i, n) in collectors.iter_mut().enumerate() {
						let code = std::char::from_digit((i + 1) as u32, 10).unwrap();
						if key_event.code == KeyCode::Char(code) {
							n.lvl += 1.0;
						}
					}
				}
			};
			for (i, c) in collectors.iter_mut().enumerate() {
				let gain = c.rate.powf(c.lvl);
				bucket.crabs += gain;
				if bucket.crabs >= bucket.size {
					bucket.crabs = bucket.size;
					full = true
				}
				println!(
					"\r\t[{}]\t+{:.0}\tLvl-{:.0}\t{}",
					i + 1,
					gain,
					c.lvl,
					c.name
				);
			}
		}
		thread::sleep(tick)
	}
}
