/*
 * test.vala
 * 
 * Copyright 2017 laurent <laurent@linux>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
using global::Luxacode.Device;
	
public static int main(string[] args)
{
	LibUSB.Context context;
	LibUSB.Context.init(out context);	
	
	try {
		Luxafor luxafor = new Luxafor(context);
		
		stdout.printf("White color\n");
		luxafor.send(new Effect.Color(255, 255, 255));

		Thread.usleep(1000000);
		
		stdout.printf("5 random colors\n");
		for (int i = 0; i < 5;i++) {
			luxafor.send(new Effect.RandomColor());
			Thread.usleep(250000);
		}

		Thread.usleep(1000000);

		stdout.printf("Red color using raw effect\n");
		luxafor.send(new Effect.Raw({1, 255, 255, 0, 0, 0, 0}));

		Thread.usleep(1000000);
		
		stdout.printf("Fade to yellow, very slowly\n");
		luxafor.send(new Effect.FadeToColor(new Effect.Color(255, 127, 0), 255));
		
		Thread.usleep(5000000);

		stdout.printf("Fade to blue, medium spedd\n");
		luxafor.send(new Effect.FadeToColor(new Effect.Color(0, 0, 255), 64));
		
		Thread.usleep(5000000);
		
		stdout.printf("Shutdown the device\n");
		luxafor.send(new Effect.Shutdown());
		
	} catch (LuxaforError error) {
		stderr.printf("Error : %s\n", error.message);
		
		return 1;
	}
	
	return 0;	
}
