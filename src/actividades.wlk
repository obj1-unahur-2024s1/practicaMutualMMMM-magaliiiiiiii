

class Actividades{

	const  idiomas=#{}  //Tipo string :no importa el orden y no interesa q apareca duplicado	
	
	method idiomas()=idiomas
// conducatas polimorficas abstractas => no se puede instanciar
	method implicaEsfuerzo()	//booleano
	method sirveParaBroncearse()  //booleano
	method cantidadDeDiasPorActividad() //tipo nro
	
	method esInteresante()=idiomas.size()>1
	// borre el self interesnate y serviaa
	// costo el ultimo and, que iba con un metodo en socio que ayuda a resolver
	method esRecomendada(unSocio)= self. esInteresante() and unSocio.esAtrayenteLaAct(self) and not unSocio.realizoActividad(self) //tipo booleano
	
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

	override method esInteresante()= super() or cantidadDeAtrraccionesPorVisitar==5
}
class ExcursionTropical inherits ExcursionALaciudad{
	
	override method cantidadDeDiasPorActividad()=super()+1
	override method sirveParaBroncearse()=true
}

class SalidaDeTrekking inherits Actividades{
	var kmDeSendero
	var cantidadDeDiasDeSOL
	
	override method cantidadDeDiasPorActividad()=kmDeSendero/50
	override method implicaEsfuerzo()= kmDeSendero>80
	override method sirveParaBroncearse()=cantidadDeDiasDeSOL>200 or (cantidadDeDiasDeSOL.between(100, 200) and kmDeSendero>120 )

	override method esInteresante()=super() and cantidadDeDiasDeSOL>140
}

class Gimnasia inherits Actividades (idiomas=#{"español"}){
	
	override method cantidadDeDiasPorActividad()=1
	override method implicaEsfuerzo()=true
	override method sirveParaBroncearse()=false
	
	override method esRecomendada(unSocio)= unSocio.edad().between(20,30)
}
class tallerLiterario inherits Actividades{
	const property libros=#{}
	
	method idiomasUsados()=
		libros.map({l=> l.idioma()}).asSet()  // el .asSet lo trabforma en conjuunto
	override method cantidadDeDiasPorActividad()= libros.size()+1
	//method cantidadDeLibrosDeUnAutor(unaAutora)= libros.count{l=> l.nombreDelAutor()==unaAutora}
	method tieneLibrosConMasDe500()= libros.any{l=> l.cantidadDepaginas()>500}
	
	//aca lo que hacemos es convocar cosas de libro como parte del comportamiento del taller literario
	method autoresDeLibros()= libros.map({l=> l.nombreDelAutor()}).asSet()  //hago un conj de libros con los nomnres de sus autores
	method todosSonDelMismoAutor()= self.autoresDeLibros().size() ==1 //booleano
	method hayMasDeUnLibro()=libros.size()>1  //hay mas de uno
	
	override method implicaEsfuerzo()=self.tieneLibrosConMasDe500() and self.todosSonDelMismoAutor() and self.hayMasDeUnLibro()
	override method sirveParaBroncearse()=false
	override method esRecomendada(unSocio)= unSocio.idiomasQueHabla().size()>1
}
class Libro{
	const property idioma
	const property cantidadDepaginas
	const property nombreDelAutor
}









