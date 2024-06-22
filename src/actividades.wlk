

class Actividades{

	const property idiomas=#{}  //Tipo string :no importa el orden y no interesa q apareca duplicado	

// conducatas polimorficas abstractas => no se puede instanciar
	method implicaEsfuerzo()	//booleano
	method sirveParaBroncearse()  //booleano
	method cantidadDeDiasPorActividad() //tipo nro

}
class ViajeDePlaya inherits Actividades{
	var largo
	
	override method implicaEsfuerzo()= largo>1200
	override method sirveParaBroncearse()= true
	override method cantidadDeDiasPorActividad()=largo / 500 

}
class ExcursionALaciudad inherits Actividades{
	 var cantidadDeAtrraccionesPorVisitar=0  //tipo nro
	 
	override method implicaEsfuerzo()= cantidadDeAtrraccionesPorVisitar.between(5,8)
	override method sirveParaBroncearse()=false
	override method cantidadDeDiasPorActividad()=cantidadDeAtrraccionesPorVisitar/2

}
class ExcursionTropical inherits ExcursionALaciudad{
	
	override method cantidadDeDiasPorActividad()=super()+1
	override method sirveParaBroncearse()=true
}














