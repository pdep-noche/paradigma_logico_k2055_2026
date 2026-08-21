primeraMarca(laSerenisima).
primeraMarca(gallo).
primeraMarca(vienisima).

%precioUnitario(Producto,Precio)
%donde Producto puede ser arroz(Marca), lacteo(Marca,TipoDeLacteo), salchicas(Marca,Cantidad)
precioUnitario(arroz(gallo),25.10).
precioUnitario(lacteo(laSerenisima,leche), 6.00).
precioUnitario(lacteo(laSerenisima,crema), 4.00).
precioUnitario(lacteo(gandara,queso(gouda)), 13.00).
precioUnitario(lacteo(vacalin,queso(mozzarella)), 12.50).
precioUnitario(salchichas(vienisima,12), 9.80).
precioUnitario(salchichas(vienisima, 6), 5.80).
precioUnitario(salchichas(granjaDelSol, 8), 5.10).

%descuento(Producto, Descuento)
descuento(lacteo(laSerenisima,leche), 0.20).
descuento(lacteo(laSerenisima,crema), 0.70).
descuento(lacteo(gandara,queso(gouda)), 0.70).
descuento(lacteo(vacalin,queso(mozzarella)), 0.05).
%- El arroz tiene un descuento del  $1.50. 
descuento(arroz(Marca), 1.5):-producto(arroz(Marca)).
%- Las salchichas tienen $0,50 de descuento si no son vienisima.
descuento(salchichas(Marca, Cant), 0.5):- producto(salchichas(Marca, Cant)), Marca\= vienisima.
% - Los lacteos tienen $2 de descuento si son leches o quesos de primera marca. (el primera marca sólo se refiere a los quesos).
descuento(lacteo(Marca, leche), 2):- producto(lacteo(Marca, leche)).
descuento(lacteo(Marca, queso(Tipo)), 2):- producto(lacteo(Marca, queso(Tipo))), primeraMarca(Marca).
% El producto con el mayor precio unitario tiene 5% de descuento.
descuento(Producto, Descuento):-mayorPrecio(Producto, Precio), Descuento is Precio * 0.05.
%compro(Cliente,Producto,Cantidad)
compro(juan,lacteo(laSerenisima,crema),2).
producto(Producto):-precioUnitario(Producto, _).

mayorPrecio(Producto, Precio):-precioUnitario(Producto, Precio), 
    forall(precioUnitario(_, OtroPrecio), Precio >= OtroPrecio).


