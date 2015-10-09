import std.file;
import std.path;
import std.stdio;
import std.string;


void main(string[] args)
{
	if (args.length >= 2)
	{
		// file processing
		foreach (f; args[1..$])
		{
			// beginning of D Interface File
			auto dinterface = "/* Generated used dinclusion by aquaratixc (github.com/aquaratixc) */\n\nconst ubyte[] <array variable> = ";
			try
			{
				// read file
				auto arr = cast(ubyte[]) read(f);
				// create D Interface string
				auto binstr = "[  ";
				foreach (elem; arr)
				{
					binstr ~= format("0x%2.2X",elem) ~ ", ";
				}
				binstr = binstr[0..$ - 2] ~ "  ];";
				
				// new D Interface File
				auto fileName = baseName(f);
				
				File file;
				file.open(baseName(f, extension(f)) ~ ".di", "w");
				scope(exit) file.write(dinterface ~ binstr ~ "\n\nconst uint <array size variable> = <array variable>.length;");
			}
			catch
			{
				// if file not created
				writeln("Input file error: " ~ f);
			}
		}
	}
	else
	{
		// if no arguments
		writeln("Usage: dinclusion file1 file2 ...");
	}
}

