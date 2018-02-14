package entidad;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import modelo.Conexion;

public class TipoEstado {
	
	
	private int idTipoEstado;
	

	private String descripcion;
	
	
	public int getIdTipoEstado() {
		return idTipoEstado;
	}
	public void setIdTipoEstado(int idTipoEstado) {
		this.idTipoEstado = idTipoEstado;
	}
	
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public static LinkedList<TipoEstado> getTipoEstados() throws SQLException{
		LinkedList<TipoEstado>lista= new LinkedList<TipoEstado>();
		Conexion con= new Conexion();
		Statement st = null;
		ResultSet rs=null;
		try{
			 st= con.getConexion().createStatement();
			 rs= st.executeQuery("select * from tipoestado");
			while(rs.next()){
				TipoEstado te= new TipoEstado();
				te.setIdTipoEstado(rs.getInt(1));
				te.setDescripcion(rs.getString(2));
				lista.add(te);
						
			}
			
		}catch(Exception e){
			// ver que va aca adentro averiguar.... 
		}finally {
			st.close();
			rs.close();
			con.getConexion().close();
			
			
		}
		return lista;
		
	}
	
	public static TipoEstado getTipoEstados(int idTipoEstado) throws SQLException{
		TipoEstado te=null;
		Conexion con= new Conexion();
		Statement st = null;
		ResultSet rs=null;
		try{
			 st= con.getConexion().createStatement();
			 rs= st.executeQuery("select * from tipoestado where idTipoEstado = '" +idTipoEstado+"'" );
			if (rs.next()) {
				te = new TipoEstado();
				te.setIdTipoEstado(rs.getInt(1));
				te.setDescripcion(rs.getString(2));

			}
			
		}catch(Exception e){
			// ver que va aca adentro averiguar.... 
		}finally {
			st.close();
			rs.close();
			con.getConexion().close();
			
			
		}
		return te;
		
	}
	
	

}
