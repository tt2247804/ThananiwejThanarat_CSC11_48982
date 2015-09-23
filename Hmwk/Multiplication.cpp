#include <iostream>
#include <cmath>

using namespace std;

double MtoY(int months)
{
	double conversion = 0.08333;
	double years = months * conversion;

	return years;
}

double AtoR(double areas)
{
	double conversion = 0.31847;
	double r2 = areas * conversion;

	return r2;
}

double RtoA(double radius)
{
	double conversion = 3.14159;
	double a = pow(radius, 2) * conversion;

	return a;
}

int main()
{
	int months = 88,
		areas = 110,
		radius = 6;
	double areas2 = 113.4,
		radius2 = 6.5;

	cout << "Conversion of " <<months<< " months to " <<MtoY(months)<< " years." << endl;
	cout << "Conversion of " <<areas<< " areas to " <<AtoR(areas)<< " radius square." << endl;
	cout << "Conversion of " <<areas2<< " areas to " <<AtoR(areas2)<< " radius square." << endl;
	cout << "Conversion of " <<radius<< " radius to " <<RtoA(radius)<< " areas." << endl;
	cout << "Conversion of " <<radius2<< " radius to " <<RtoA(radius2)<< " areas." << endl;
	cout << endl;

	return 0;
}
