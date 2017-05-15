package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.Producto;
import mybatis.MyBatisUtil;
import mybatis.mapper.ProductoMapper;

public class ProductoService implements ProductoMapper {

	public int registrarProducto(Producto pro) {
		int filasAfectadas = -1;
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			filasAfectadas = promap.registrarProducto(pro);
			session.commit();
		} catch (Exception e) {
			System.out.println("ERROR>>>" + e.getMessage());
			session.rollback();
		}
		return filasAfectadas;
	}

	public int modificarProducto(Producto pro) {
		int filasAfectadas = -1;
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			filasAfectadas = promap.modificarProducto(pro);
			session.commit();
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
			session.rollback();
		}
		return filasAfectadas;
	}

	public int eliminarProducto(int cod) {
		int filasAfectadas = -1;
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			filasAfectadas = promap.eliminarProducto(cod);
			session.commit();
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
			session.rollback();
		}
		return filasAfectadas;
	}

	public List<Producto> listarProductos() {
		List<Producto> listaPro = new ArrayList<Producto>();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			listaPro = promap.listarProductos();
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return listaPro;
	}

	public List<Producto> listarCategorias() {
		List<Producto> listaPro = new ArrayList<Producto>();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			listaPro = promap.listarCategorias();
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return listaPro;
	}

	public List<Producto> buscarProducto(int cod) {
		List<Producto> listaPro = new ArrayList<Producto>();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			listaPro = promap.buscarProducto(cod);
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return listaPro;
	}

	@Override
	public List<Producto> autoCompletar(String nom) throws Exception {
		List<Producto> listaPro = new ArrayList<Producto>();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			listaPro = promap.autoCompletar(nom);
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return listaPro;
	}

	@Override
	public List<Producto> filtrarPorCategoria(String nom) throws Exception {
		List<Producto> listaPro = new ArrayList<Producto>();
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			ProductoMapper promap = session.getMapper(ProductoMapper.class);
			listaPro = promap.filtrarPorCategoria(nom);
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return listaPro;
	}
}
