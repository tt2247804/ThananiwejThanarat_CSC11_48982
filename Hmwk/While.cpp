#include <iostream>

using namespace std;

int main()
{
	int R0 = 0, R1 = 1;

	while(R1 <= 10)
	{
		R0 += R1;
		R1++;
	}

	cout << R0 << endl;

	return 0;
}
