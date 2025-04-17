import os

fn find_md(dir string)! {
   for f in os.ls(dir) or {println("missing directory "+dir); exit(1)} {
      mut ff := dir + "/" + f
      mut lon := utf8_str_visible_length(ff)
      match true {
         os.is_dir(ff) {
            find_md(ff)!
         }
         ff.substr(lon-3,lon) == ".md" {
            mut off := ff.replace("/content/","/docs/")
            off = off.replace(".md",".html")
            println("multimarkdown -o "+off+ " "+ff)
            os.execute("multimarkdown -o "+off+ " "+ff)
         }
         else {
         }
      }
   }
}

fn main() {
  mut the_dir := "."
  if os.args.len >= 2 {
     the_dir = os.args[1]
  }
  the_dir = the_dir + "/content"
  find_md(the_dir)!
}
