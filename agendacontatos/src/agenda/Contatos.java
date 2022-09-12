package agenda;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import model.Dao;
import net.proteanit.sql.DbUtils;

import java.awt.Toolkit;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.Cursor;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Contatos extends JFrame {

	private JPanel contentPane;
	private JTextField txtNome;
	private JTextField txtTel;
	private JTextField txtEmail;
	private JTextField txtContatos;
	private JTable tblContatos;
	private JButton btnPesquisarContatos;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Contatos frame = new Contatos();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Contatos() {
		setTitle("Agenda de contatos");
		setIconImage(Toolkit.getDefaultToolkit().getImage(Contatos.class.getResource("/img/logo.png")));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 496, 337);
		contentPane = new JPanel();
		contentPane.setFocusCycleRoot(true);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Nome");
		lblNewLabel.setBounds(10, 185, 49, 14);
		contentPane.add(lblNewLabel);
		
		txtNome = new JTextField();
		txtNome.setEditable(false);
		txtNome.setBounds(51, 182, 229, 20);
		contentPane.add(txtNome);
		txtNome.setColumns(10);
		
		JLabel lblTelefone = new JLabel("Telefone");
		lblTelefone.setBounds(10, 230, 59, 14);
		contentPane.add(lblTelefone);
		
		txtTel = new JTextField();
		txtTel.setEditable(false);
		txtTel.setColumns(10);
		txtTel.setBounds(61, 227, 173, 20);
		contentPane.add(txtTel);
		
		txtEmail = new JTextField();
		txtEmail.setEditable(false);
		txtEmail.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
		txtEmail.setColumns(10);
		txtEmail.setBounds(51, 269, 188, 20);
		contentPane.add(txtEmail);
		
		JLabel lblEmail = new JLabel("Email");
		lblEmail.setBounds(10, 272, 49, 14);
		contentPane.add(lblEmail);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 74, 444, 100);
		contentPane.add(scrollPane);
		
		tblContatos = new JTable();
		tblContatos.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				setarCaixasTexto();
			}
		});
		scrollPane.setViewportView(tblContatos);
		
		txtContatos = new JTextField();
		txtContatos.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
				pesquisarContatoTabela();
			}
		});
		txtContatos.setColumns(10);
		txtContatos.setBounds(68, 28, 246, 20);
		contentPane.add(txtContatos);
		
		JLabel lblContatos = new JLabel("Contatos");
		lblContatos.setBounds(10, 31, 59, 14);
		contentPane.add(lblContatos);
		
		btnPesquisarContatos = new JButton("");
		btnPesquisarContatos.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				pesquisarContato();
			}
		});
		btnPesquisarContatos.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnPesquisarContatos.setIcon(new ImageIcon(Contatos.class.getResource("/img/search.png")));
		btnPesquisarContatos.setToolTipText("Pesquisar");
		btnPesquisarContatos.setBounds(322, 13, 48, 48);
		contentPane.add(btnPesquisarContatos);
		
		btnAdicionar = new JButton("");
		btnAdicionar.setEnabled(false);
		btnAdicionar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				adicionarContato();
			}
		});
		btnAdicionar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnAdicionar.setIcon(new ImageIcon(Contatos.class.getResource("/img/add.png")));
		btnAdicionar.setToolTipText("Adicionar");
		btnAdicionar.setBounds(263, 244, 48, 48);
		contentPane.add(btnAdicionar);
		
		btnEditar = new JButton("");
		btnEditar.setEnabled(false);
		btnEditar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				editarContato();
			}
		});
		btnEditar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnEditar.setIcon(new ImageIcon(Contatos.class.getResource("/img/edit.png")));
		btnEditar.setToolTipText("Editar");
		btnEditar.setBounds(335, 244, 48, 48);
		contentPane.add(btnEditar);
		
		btnExcluir = new JButton("");
		btnExcluir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				excluirContato();
			}
		});
		btnExcluir.setEnabled(false);
		btnExcluir.setIcon(new ImageIcon(Contatos.class.getResource("/img/delete.png")));
		btnExcluir.setToolTipText("Excluir");
		btnExcluir.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnExcluir.setBounds(406, 244, 48, 48);
		contentPane.add(btnExcluir);
		
		txtIdContato = new JTextField();
		txtIdContato.setEditable(false);
		txtIdContato.setEnabled(false);
		txtIdContato.setBounds(309, 185, 36, 29);
		contentPane.add(txtIdContato);
		txtIdContato.setColumns(10);
	}
	// fim do construtor
	
	Dao dao = new Dao();
	private JTable tblContato;
	private JButton btnAdicionar;
	private JButton btnEditar;
	private JButton btnExcluir;
	private JTextField txtIdContato;
	
	private void pesquisarContatoTabela() {
		String readT = "select id as ID ,nome as Nome,fone as Telefone, email as Email from contatos where nome like ?";
		try {
			// estabelecer conexão
			Connection con = dao.conectar();
			// Preparar a execução da query
			PreparedStatement pst = con.prepareStatement(readT);
			// Substituir os ???? pelo conteudo das caixas de texto
			pst.setString(1, txtContatos.getText() + "%");
			ResultSet rs = pst.executeQuery();
			//uso da biblioteca ts2xml para "popular" a tabela
			tblContatos.setModel(DbUtils.resultSetToTableModel(rs));
			
			con.close();
			
		}	catch(Exception e){
			System.out.println(e);
		}
		
	}
	
	/**
	 * Método responsavel por setar as caixas  de texto
	 * de acordo com os campos da tabela (mouse click)
	 */
	
	private void setarCaixasTexto() {
		//criar uma variável para receber a linha da tabela
	int setar = tblContatos.getSelectedRow();
	txtIdContato.setText(tblContato.getModel().getValueAt(setar, 0).toString());
	txtContatos.setText(tblContato.getModel().getValueAt(setar, 1).toString());

	btnAdicionar.setEnabled(false);
	
	}
	// demais metodos de CRUD
	
	private void pesquisarContato() {
		// validação
		if (txtIdContato.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Contato inexistente");
			txtIdContato.requestFocus();
			txtNome.setEditable(true);
			txtTel.setEditable(true);
			txtEmail.setEditable(true);
			btnAdicionar.setEnabled(true);
			limparCamposContatos();
		} else {
			String read = "select * from contatos where id = ?;";
			try {

				Connection con = dao.conectar();

				PreparedStatement pst = con.prepareStatement(read);

				pst.setString(1, txtIdContato.getText());

				ResultSet rs = pst.executeQuery();

				// Uso da bilblioteca rs2xml para "popular" a tabela
				tblContatos.setModel(DbUtils.resultSetToTableModel(rs));
				
				if (rs.next()) {
					txtIdContato.setText(rs.getString(0));
					txtNome.setText(rs.getString(1));
					txtTel.setText(rs.getString(2));
					txtEmail.setText(rs.getString(3));
					btnEditar.setEnabled(true);
					btnExcluir.setEnabled(true);
				}
				con.close();
			} 	catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	
	private void adicionarContato() {
		// validação
		if (txtNome.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o nome do contato");
			txtNome.requestFocus();
		} else if (txtTel.getText().isEmpty()) {
			JOptionPane.showMessageDialog(null, "Preencha o telefone");
			txtTel.requestFocus();
		} else {
			// lógica principal
			String create = "insert into contatos (id,nome,fone,email) values(?,?,?,?)";
			try {
				// estabelecer conexão
				Connection con = dao.conectar();
				// Preparar a execução da query
				PreparedStatement pst = con.prepareStatement(create);
				// Substituir os ???? pelo conteudo das caixas de texto
				pst.setString(1, txtNome.getText());
				pst.setString(2, txtTel.getText());
				pst.setString(3, txtEmail.getText());
				// Executar a query e inserir o usuario no banco
				pst.executeUpdate();
				limparCamposContatos();
				// Encerrar a conexão
				con.close();
				JOptionPane.showMessageDialog(null, "Contato cadastrado com sucesso");	
			} catch (SQLIntegrityConstraintViolationException ex) {
				JOptionPane.showMessageDialog(null, "Ocorreu um erro.\nVerifique se o telefone está inserido em outro contato");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	private void editarContato() {
				if (txtNome.getText().isEmpty()) {
					JOptionPane.showMessageDialog(null, "Digite o nome do contato");
					txtNome.requestFocus();
				} 
				else {
					String update = "update contatos set nome=?, fone=?, email=? where id=?";
					try {
						Connection con = dao.conectar();
						PreparedStatement pst = con.prepareStatement(update);
						pst.setString(1, txtNome.getText());
						pst.setString(2, txtTel.getText());
						pst.setString(3, txtEmail.getText());
						limparCamposContatos();
				
						// Encerrar a conexão
						con.close();
						
						JOptionPane.showMessageDialog(null, "Dados do cliente alterados");
					} catch (SQLIntegrityConstraintViolationException ex) {
						JOptionPane.showMessageDialog(null, "Ocorreu um erro.\nVerifique se os dados ja não estão inseridos em um outro cliente.");
					} catch (Exception e) {
						System.out.println(e);
						}
				}
	}
	private void excluirContato() {
		//validação (confirmação de exclusão)
		int confirma = JOptionPane.showConfirmDialog(null, "Confirma a exclusão do contato?", "Atenção!",JOptionPane.YES_NO_OPTION);
		if (confirma == JOptionPane.YES_OPTION) {
			//Lógica principal
			String delete = "delete from contato where id=?;";
			
		 try {
				// Estabelecer conexão
				Connection con = dao.conectar();
				// Preparar a execução da query (comando sql) substituindo a ? pelo iduser
				PreparedStatement pst = con.prepareStatement(delete);
				pst.setString(1,txtNome.getText());
				// Executar a query
				pst.executeUpdate();
				// confirmação
				limparCamposContatos();
				JOptionPane.showMessageDialog(null, "Contato excluído com sucesso.");
				
				limparCamposContatos();
			}	catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	private void limparCamposContatos() {
		txtNome.setText(null);
		txtTel.setText(null);
		txtEmail.setText(null);
		btnAdicionar.setEnabled(false);
		btnEditar.setEnabled(false);
		btnExcluir.setEnabled(false);
	}
}
