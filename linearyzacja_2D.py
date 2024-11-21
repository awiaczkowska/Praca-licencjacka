import sympy as s

s.init_printing()
# zmienne
x = s.Symbol('x')
y = s.Symbol('y')

# parametry
a2 = s.Symbol("a_2")
a1 = s.Symbol("a_1")

b2 = s.Symbol("b_2")
b1 = s.Symbol("b_1")

r2 = s.Symbol("r_2")
r1 = s.Symbol("r_1")

K2 = s.Symbol("K_2")
K1 = s.Symbol("K_1")

c2 = s.Symbol("c_2")
c1 = s.Symbol("c_1")

d = s.Symbol("d")

# uklad rownan
g1 = r1 * x * (1 - 1 / K1 * x - a1 / K2 * y)
g2 = r2 * y * (1 - 1 / K2 * y - a2 / K1 * x)


class Uklad:
    def __init__(self, f1, f2):
        self.f1 = f1
        self.f2 = f2

    def czy_stacjonarny(self, pkt):
        # podstawiamy wspolrzedne punktu i sprawdzamy czy zerują f1,f2
        G1 = (self.f1).subs({x: pkt[0], y: pkt[1]})
        G2 = (self.f2).subs({x: pkt[0], y: pkt[1]})

        return G1.equals(0) and G2.equals(0)

    def macierz_linearyzacji(self, pkt):
        '''metoda wyświetlająca macierz linearyzacji (dla układu 2 pierwszych równań)
        bez wstawionego punktu pkt'''
        if self.czy_stacjonarny(pkt) == False:
            raise ValueError("Podany punkt nie jest stacjonarny!")

        g1 = self.f1.subs({x: x + pkt[0], y: y + pkt[1]})
        g2 = self.f2.subs({x: x + pkt[0], y: y + pkt[1]})

        matrix = s.Array([
            [s.diff(g1, x), s.diff(g1, y)],
            [s.diff(g2, x), s.diff(g2, y)]
        ])
        return matrix

    def linearyzacja(self, pkt):
        matrix = self.macierz_linearyzacji(pkt)
        return matrix.subs({x: 0, y: 0})


U = Uklad(g1, g2)
if __name__ == "__main__":

    stacjonarne1 = {
        'A': {x: 0, y: 0},
        'B': {x: K1, y: 0},
        'C': {x: 0, y: K2},
        'D': {x: K1 * (1 - a1) / (1 - a1 * a2),
              y: K2 * (1 - a2) / (1 - a1 * a2),
              }
    }

    stacjonarne2 = {
        'A': (0, 0),
        'B': (K1, 0),
        'C': (0, K2),
        'D': (K1 * (1 - a1) / (1 - a1 * a2), K2 * (1 - a2) / (1 - a1 * a2))
    }

    # s.pprint((U.linearyzacja(stacjonarne2['A'])))

    with open('linearyzacja_2D.tex', 'w') as f:  # sformatowane na latex
        with open('linearyzacja_2D.txt', 'w') as t:  # sformatowane na tabelki
            for key in stacjonarne2:
                f.write("Punkt " + key)
                f.write('\n')

                t.write("Punkt " + key)
                t.write('\n')

                # s.pprint(s.latex(U.macierz_linearyzacji()))

                f.write("$$" + s.latex(U.linearyzacja(stacjonarne2[key]).simplify()) + "$$")
                f.write('\n');
                f.write('\n')

                # matr=str(U.linearyzacja(stacjonarne2[key]).simplify())

                t.write(str(U.linearyzacja(stacjonarne2[key]).simplify()).strip(' '))
                t.write('\n\n')

    with open ('linearyzacja.tex', 'w') as f:
        for key in stacjonarne2:
            f.write("Punkt " + key)
            f.write('\n')

            t.write("Punkt " + key)
            t.write('\n')

            # s.pprint(s.latex(U.macierz_linearyzacji()))
            f.write("$$" + s.latex(U.macierz_linearyzacji(stacjonarne2[key])) + "$$")
            f.write('\n')

            f.write("$$" + s.latex(U.linearyzacja(stacjonarne2[key]).simplify()) + "$$")
            f.write('\n');
            f.write('\n')

            t.write(U.linearyzacja(stacjonarne2[key]).simplify())

