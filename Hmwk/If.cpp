#include <iostream>

using namespace std;

int main()
{
	int R0, R1;

	cout <<"Please enter a number: " ;
	cin >> R1;

	if(R1 == 1 || R1 == 3)
	{
		R0 = 11;
	}

	if(R1 == 2 || R1 == 4)
	{
		R0 = 5;
	}

	if(R1 == 5)
	{
		R0 = 1;
	}

	if(R1 < 1 || R1 > 5)
	{
		R0 = 0;
	}

	cout << R0 << endl;

	return 0;
}
