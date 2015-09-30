#include <iostream>

using namespace std;

int main()
{
	int num = 88, deno = 5, mod, count, 
		count1, div = 0;
	int value = num;

	while(num > deno)
	{
		count = -1;
		count1 = 1;

		while(deno < num)
		{
			deno = deno << 1;
			count++;
			count1 = count1 << 1;
		}

		deno = deno >> 1;
		count1 = count1 >> 1;
		num = num - deno;

		deno = deno >> count;
		div = div + count1;
	}

	mod = num;

	cout << "The results: " << endl;
	cout << value << " / " << deno << " = " << div << endl;
	cout << value << " % " << deno << " = " << mod << endl;

	return 0;
}
