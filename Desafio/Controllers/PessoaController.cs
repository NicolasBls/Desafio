using Desafio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Desafio.Controllers
{
    public class PessoaController : Controller
    {
        IATecEntities db = new IATecEntities();

        [HttpGet]
        public ActionResult Listar()
        {
            var lista = db.Pessoa.ToList();

            return View(lista);
        }

        [HttpGet]
        public ActionResult Criar()
        {
            return PartialView("_Criar");
        }

        [HttpPost]
        public ActionResult Criar(Pessoa pessoa)
        {
            db.Pessoa.Add(pessoa);
            db.SaveChanges();

            return RedirectToAction("Listar");
        }

        [HttpGet]
        public ActionResult Editar(int pessoaId)
        {
            var pessoa = db.Pessoa.FirstOrDefault(x => x.pessoaId == pessoaId);
            ViewBag.data = pessoa.dataNascimento.ToString("yyyy-MM-dd");
            ViewBag.pessoaId = pessoaId;
            ViewBag.cpf = pessoa.cpf;

            return View(pessoa);
        }
        [HttpPost]
        public ActionResult Editar(Pessoa pessoa)
        {
            ViewBag.pessoaId = pessoa.pessoaId;
            var p = db.Pessoa.FirstOrDefault(x => x.pessoaId == pessoa.pessoaId);

            p.nome = pessoa.nome;
            p.cpf = pessoa.cpf;
            p.dataNascimento = pessoa.dataNascimento;
            p.email = pessoa.email;

            db.Entry(p).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Listar");
        }
        [HttpGet]
        public ActionResult Detalhes(int pessoaId)
        {
            var pessoa = db.Pessoa.FirstOrDefault(x => x.pessoaId == pessoaId);
            ViewBag.numero = db.Numero.Where(x => x.pessoaId == pessoaId).ToList();
            ViewBag.endereco = db.Endereco.Where(x => x.pessoaId == pessoaId).ToList();
            return View(pessoa);
        }
        [HttpPost]
        public ActionResult Deletar(int pessoaId)
        {
            var listaT = db.Numero.Where(x => x.pessoaId == pessoaId).ToList();
            foreach (var n in listaT)
            {
                db.Numero.Remove(n);
            }
            var listaE = db.Endereco.Where(x => x.pessoaId == pessoaId).ToList();
            foreach (var e in listaE)
            {
                db.Endereco.Remove(e);
            }
            var pessoa = db.Pessoa.FirstOrDefault(x => x.pessoaId == pessoaId);
            db.Pessoa.Remove(pessoa);
            db.SaveChanges();
            return RedirectToAction("Listar");
        }
        //TELEFONE
        [HttpGet]
        public ActionResult _ListarNumero(int pessoaId)
        {
            var lista = db.Numero.Where(x => x.pessoaId == pessoaId).ToList();
            return PartialView(lista);
        }
        [HttpGet]
        public ActionResult Telefone(int pessoaId)
        {
            ViewBag.pessoaId = pessoaId;
            return View();
        }

        [HttpPost]
        public ActionResult Telefone(Numero numero)
        {
            ViewBag.pessoaId = numero.pessoaId;
            db.Numero.Add(numero);
            db.SaveChanges();

            return RedirectToAction("Telefone", new { pessoaId = numero.pessoaId });
        }
        [HttpGet]
        public ActionResult DeletarNumero(int numeroId)
        {
            var numero = db.Numero.FirstOrDefault(x => x.numeroId == numeroId);
            ViewBag.pessoaId = numero.pessoaId;
            db.Numero.Remove(numero);
            db.SaveChanges();

            return RedirectToAction("Telefone", new { pessoaId = numero.pessoaId });
        }

        //ENDEREÇO
        [HttpGet]
        public ActionResult _ListarEndereco(int pessoaId)
        {
            var lista = db.Endereco.Where(x => x.pessoaId == pessoaId).ToList();
            return PartialView(lista);
        }
        [HttpGet]
        public ActionResult Endereco(int pessoaId)
        {
            ViewBag.pessoaId = pessoaId;
            return View();
        }
        [HttpPost]
        public ActionResult Endereco(Endereco endereco)
        {
            ViewBag.pessoaId = endereco.pessoaId;
            db.Endereco.Add(endereco);
            db.SaveChanges();

            return RedirectToAction("Endereco", new { pessoaId = endereco.pessoaId });
        }
        [HttpGet]
        public ActionResult DeletarEndereco(int enderecoId)
        {
            var endereco = db.Endereco.FirstOrDefault(x => x.enderecoId == enderecoId);
            ViewBag.pessoaId = endereco.pessoaId;
            db.Endereco.Remove(endereco);
            db.SaveChanges();

            return RedirectToAction("Endereco", new { pessoaId = endereco.pessoaId });
        }

    }
}