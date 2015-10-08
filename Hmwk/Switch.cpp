#include <iostream>

using namespace std;

int main()
{
	int R0, R1;

	cout <<"Please enter a number: " ;
	cin >> R1;

	switch(R1)
	{
		case 1:
		case 3:
			R0 = 11;
			break;
		case 2:
		case 4:
			R0 = 5;
			break;
		case 5:
			R0 = 1;
			break;
		default:
			R0 = 0;
			break;
	}

	cout << R0 << endl;

	return 0;
}
