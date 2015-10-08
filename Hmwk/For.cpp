#include <iostream>

using namespace std;

int main()
{
	int R0 = 0, R1;

	for(R1 = 1; R1 <= 10; R1++)
	{
		R0 += R1;
	}

	cout << R0 << endl;

	return 0;
}
