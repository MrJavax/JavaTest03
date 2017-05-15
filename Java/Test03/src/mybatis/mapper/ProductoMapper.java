package mybatis.mapper;

import java.util.List;

import model.Producto;

public interface ProductoMapper {
	public List<Producto> autoCompletar(String nom) throws Exception;

	public List<Producto> buscarProducto(int cod) throws Exception;
	
	public List<Producto> filtrarPorCategoria(String nom) throws Exception;
	
	public List<Producto> listarCategorias() throws Exception;

	public List<Producto> listarProductos() throws Exception;

	public int registrarProducto(Producto pro) throws Exception;

	public int modificarProducto(Producto pro) throws Exception;

	public int eliminarProducto(int cod) throws Exception;
}
