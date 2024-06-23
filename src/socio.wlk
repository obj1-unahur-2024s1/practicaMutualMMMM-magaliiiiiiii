import actividades.*

class Socio {
	
	var edad
	const property idiomasQueHabla=#{}
	
	const property listaDeActividadesParaRealizar=[] //considero q se puede repetir, no dice nada el enunciado
	var cantidadMaximaDeActividades
	
	method esAdoradorDelSol()=
		listaDeActividadesParaRealizar.all{a=> a.sirveParaBroncearse()}
	
	//o sea, las actividades que realizó que implican esfuerzo.
	method actividadesEsforzadas()=
		listaDeActividadesParaRealizar.filter{a=> a.implicaEsfuerzo()}
	
	method cantidadDeActividadesRegistradas()=
		listaDeActividadesParaRealizar.size()
	
	method registrarUnaACtividad(unaAct){
		if(cantidadMaximaDeActividades== self.cantidadDeActividadesRegistradas()){
		self.error(" suficientes actividades, lista de actividades completa")
		
	}else listaDeActividadesParaRealizar.add(unaAct)}
	 
	method esAtrayenteLaAct(unaActividad)
	
	method realizoActividad(unaActividad)= listaDeActividadesParaRealizar.countains(unaActividad)
	// como lo haria :listaDeActividadesParaRealizar.any{x=> x ==unaActividad}
	
}
class Tranquilo inherits Socio{
	
	override method esAtrayenteLaAct(unaActividad)= unaActividad.cantidadDeDiasPorActividad()>=4  //porque dice al menos
}
class Coherente inherits Socio{
	override method esAtrayenteLaAct(unaActividad)=
		if(self.esAdoradorDelSol())unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
	
}
class Relajado inherits Socio{
	
// la condición es hablar al menos uno de los idiomas que se usan en la actividad
	override method esAtrayenteLaAct(unaActividad)= 
	//unaActividad.idiomas().inyersection(idiomasQueHabla)
	not (idiomasQueHabla.intersection(unaActividad.idiomas()).isEmpty())  
	//  la interseccion no sea vacia- disjuntos
		
	
}



