package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entidad.Categoria;
import modelo.Conexion;

public class CategoriasDAO {
	private String INSERT= "insert into categorias ( idCategorias, descripcion, estado)values (?,?,?)";
	private String DELETE="delete from categorias where idCategorias=?";
	private String EDITAR="update categorias set descripcion=?, estado=? where idCategorias=?";
	private String LISTARTODACATEGORIA="select * from categorias";
	private String LISTARPORCODIGOCAT="select * from categorias where idCategorias=?";
	private Connection con;
	
	public CategoriasDAO() {
		Conexion c=new Conexion();
		con=c.getConexion();
		
	}
	
	public void nuevaCategoria(Categoria cat) {
		try {
			PreparedStatement ps= con.prepareStatement(INSERT);
			ps.setInt(1, cat.getIdcateogria());
			ps.setString(2,cat.getDescripcion());
			ps.setInt(3, cat.getEstado());
			ps.executeUpdate();
			ps.close();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void editarCategoria(Categoria cat) {
		try {
			PreparedStatement ps= con.prepareStatement(EDITAR);
			//ps.setInt(1, cat.getIdcateogria());
			ps.setString(2,cat.getDescripcion());
			ps.setInt(3, cat.getEstado());
			ps.executeUpdate();
			ps.close();
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void eliminarCategoria(Categoria cat) {
		try {
			
			PreparedStatement ps= con.prepareStatement(DELETE);
			ps.setInt(1,cat.getIdcateogria());
			ps.executeUpdate();
			ps.close();
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public LinkedList<Categoria> listarTodasLasCategorias(){
		LinkedList<Categoria>listaCategorias= new LinkedList<Categoria>();
		
		
		try{
			
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(LISTARTODACATEGORIA);
			while(rs.next()) {
				Categoria cat= new Categoria();
				cat.setIdcateogria(rs.getInt(1));
				cat.setDescripcion(rs.getString(2));
				cat.setEstado(rs.getInt(3));
				listaCategorias.add(cat);
			}
			}catch (SQLException ex) {
				// TODO: handle exception
				ex.printStackTrace();
			}
		
		return listaCategorias;
		
	}
	public Categoria buscarporIdCategoria(int idCat) {
		Categoria categorias =new Categoria();
		try {
			PreparedStatement ps= con.prepareStatement(LISTARPORCODIGOCAT);
			ps.setInt(1,idCat);
			ResultSet rs= ps.executeQuery();
			while (rs.next()) {
				categorias.setIdcateogria(rs.getInt(1));
				categorias.setDescripcion(rs.getString(2));
				categorias.setEstado(rs.getInt(3));
				
			}
			rs.close();
			ps.close();
		} catch (SQLException ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		return categorias;
	}
}
