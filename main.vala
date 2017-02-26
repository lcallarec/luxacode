/*
 * vala-luxafor.vala
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
Luxafor.Luxafor? luxafor;
public static int main(string[] args)
{
	LibUSB.Context context;
	LibUSB.Context.init(out context);	
	
	luxafor = new Luxafor.Luxafor(context);
	if (luxafor != null) {
		
		luxafor.send(new Luxafor.Effect.Color(255, 0, 0, 255));
		
		//Wait a bit :p
		for(int i = 0;i < 500000000;i++) {}

		luxafor.send(new Luxafor.Effect.Shutdown());
		
	} else {
		stdout.printf ("FAILED TO CREATE LUXAFOR\n");
	}
	
	return 0;
}
