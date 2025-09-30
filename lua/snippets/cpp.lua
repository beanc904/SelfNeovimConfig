local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local function lower_name(args)
  return args[1][1]:lower()
end

local function upper_name(args)
  return args[1][1]:upper()
end

ls.add_snippets("cpp", {
  -- main.cc in Qt
  s("qtmain",
    fmt([[
#include <QApplication>

#include "mainwindow.h"

int main(int argc, char *argv[]) {{
  // QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  // QApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

  QApplication a(argc, argv);

  MainWindow w;
  w.show();
  return a.exec();
}}
]], {}),
    {
      show_condition = function()
        return vim.fn.expand("%:t") == "main.cc"
      end
    }
  ),

  -- mainwindow.cc in Qt
  s("qtmainw",
    fmt([[
  #include "mainwindow.h"

  #include <QDebug>

  #include "./ui_mainwindow.h"

  MainWindow::MainWindow(QWidget *parent)
      : QMainWindow(parent), ui(new Ui::MainWindow) {{
    ui->setupUi(this);
    // connect(ui->actionExit, &QAction::triggered, this, &MainWindow::close);
  }}

  MainWindow::~MainWindow() {{
    delete ui;
  }}
  ]], {}),
    {
      show_condition = function()
        return vim.fn.expand("%:t") == "mainwindow.cc"
      end
    }
  ),

  -- mainwindow.h in Qt
  s("qtmainw",
    fmt([[
  #ifndef MAINWINDOW_H
  #define MAINWINDOW_H

  #include <QMainWindow>

  QT_BEGIN_NAMESPACE
  namespace Ui {{
  class MainWindow;
  }}
  QT_END_NAMESPACE

  class MainWindow : public QMainWindow {{
    Q_OBJECT

   public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

   private:
    Ui::MainWindow *ui;

   private slots:
    // slots here
  }};

  #endif  // !MAINWINDOW_H
  ]], {}),
    {
      show_condition = function()
        return vim.fn.expand("%:t") == "mainwindow.h"
      end
    }
  ),

  -- dialog.cc in Qt
  s("qtdlg",
    fmt([[
  #include "{}.h"

  #include "./ui_{}.h"

  {}::{}(QWidget *parent) : QDialog(parent), ui(new Ui::{}) {{
    ui->setupUi(this);
  }}

  {}::~{}() {{
    delete ui;
  }}
  ]], {
      f(lower_name, { 1 }),
      f(lower_name, { 1 }),
      i(1, "Dialog"),
      rep(1),
      rep(1),
      rep(1),
      rep(1),
    }),
    {
      show_condition = function()
        return vim.fn.expand("%:e") == "cc"
      end
    }
  ),

  -- dialog.h in Qt
  s("qtdlg", fmt([[
#ifndef {}_H
#define {}_H

#include <QDialog>

QT_BEGIN_NAMESPACE
namespace Ui {{
class {};
}}
QT_END_NAMESPACE

class {} : public QDialog {{
  Q_OBJECT

 public:
  {}(QWidget *parent = nullptr);
  ~{}();

 private:
  Ui::{} *ui;
}};

#endif  // !{}_H
  ]], {
      f(upper_name, { 1 }),
      f(upper_name, { 1 }),
      i(1, "Dialog"),
      rep(1),
      rep(1),
      rep(1),
      rep(1),
      f(upper_name, { 1 }),
    }),
    {
      show_condition = function()
        return vim.fn.expand("%:e") == "h"
      end
    }
  ),
})
