package action;

import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;
import model.Producto;
import service.ProductoService;

@ParentPackage("dawi")
public class ProductoAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Producto> listaPro = new ArrayList<Producto>();
	private Producto pro;
	private ProductoService service = new ProductoService();

	@Action(value = "/autoCompletar", results = { @Result(name = "auto", type = "json") })
	public String autoCompletar() {
		System.out.println("auto");
		try {
			listaPro = service.autoCompletar(getPro().getNombre());
		} catch (Exception e) {
			System.out.println("ERROR >>>" + e.getMessage());
		}
		return "auto";
	}

	@Action(value = "/buscarProducto", results = { @Result(name = "buscar", location = "/Modificar.jsp") })
	public String buscarProducto() {
		try {
			listaPro = service.buscarProducto(getPro().getCodigo());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "buscar";
	}

	@Action(value = "/listarProductos", results = { @Result(name = "listar", location = "/Listado.jsp") })
	public String listarProductos() {
		try {
			listaPro = service.listarProductos();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "listar";
	}

	@Action(value = "/registrarProducto", results = { @Result(name = "registrar", location = "/Registro.jsp"),
			@Result(name = "error", location = "/Registro.jsp") })
	public String registrarProducto() {
		int filasAfectadas = -1;
		filasAfectadas = service.registrarProducto(pro);
		if (filasAfectadas == -1 || getPro().getFecha() == null) {
			addActionError("Error al registrar");
			return "error";
		} else {
			addActionMessage("Se registró correctamente");
			return "registrar";
		}
	}

	@Action(value = "/eliminarProducto", results = {
			@Result(name = "eliminar", type = "redirect", location = "/listarProductos"),
			@Result(name = "error", location = "/Listado.jsp") })
	public String eliminarProducto() {
		int filasAfectadas = -1;
		filasAfectadas = service.eliminarProducto(getPro().getCodigo());
		if (filasAfectadas == -1) {
			addActionError("Error al eliminar");
			return "error";
		} else {
			addActionMessage("Se eliminó correctamente.");
			return "eliminar";
		}
	}

	@Action(value = "/listarCategorias", results = { @Result(name = "listarCat", type = "json") })
	public String listarCategorias() {
		try {
			listaPro = service.listarCategorias();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "listarCat";
	}

	@Action(value = "/modificarProducto", results = {
			@Result(name = "modificar", type = "redirect", location = "/listarProductos"),
			@Result(name = "error", location = "/Modificar.jsp") })
	public String modificarProducto() {
		int filasAfectadas = -1;
		if (!getPro().getCategoria().equals("-1") || filasAfectadas > 0) {
			filasAfectadas = service.modificarProducto(pro);
			addActionMessage("Se modificó correctamente");
			return "modificar";
		} else {
			addActionError("Error al modificar");
			return "error";
		}
	}

	@Action(value = "/filtrar", results = { @Result(name = "filtrado", location = "/Listado.jsp") })
	public String filtrar() {
		try {
			listaPro = service.filtrarPorCategoria(pro.getCategoria());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "filtrado";
	}

	public List<Producto> getListaPro() {
		return listaPro;
	}

	public void setListaPro(List<Producto> listaPro) {
		this.listaPro = listaPro;
	}

	public Producto getPro() {
		return pro;
	}

	public void setPro(Producto pro) {
		this.pro = pro;
	}
}
