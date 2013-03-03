using System;
using System.Web;
using System.Web.Optimization;

namespace FTMatricula
{
    public class BundleConfig
    {

        public static void AddDefaultIgnorePatterns(IgnoreList ignoreList)
        {
            if (ignoreList == null)
                throw new ArgumentNullException("ignoreList");
            ignoreList.Ignore("*.intellisense.js");
            ignoreList.Ignore("*-vsdoc.js");
            ignoreList.Ignore("*.debug.js", OptimizationMode.WhenEnabled);
            //ignoreList.Ignore("*.min.js", OptimizationMode.WhenDisabled);
            //ignoreList.Ignore("*.min.css", OptimizationMode.WhenDisabled);
        }

        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();
            AddDefaultIgnorePatterns(bundles.IgnoreList);

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Content/scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Content/scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Content/scripts/jquery.unobtrusive*",
                        "~/Content/scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Content/scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/FTMatriculaJS").Include(
                        "~/Content/scripts/util.js",
                        "~/Content/scripts/layout.js"));

            bundles.Add(new StyleBundle("~/bundles/FTMatriculaCSS").Include(
                        "~/Content/styles/defaults.css",
                        "~/Content/styles/internal.css"));

            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                        "~/Content/themes/base/jquery.ui.core.css",
                        "~/Content/themes/base/jquery.ui.resizable.css",
                        "~/Content/themes/base/jquery.ui.selectable.css",
                        "~/Content/themes/base/jquery.ui.accordion.css",
                        "~/Content/themes/base/jquery.ui.autocomplete.css",
                        "~/Content/themes/base/jquery.ui.button.css",
                        "~/Content/themes/base/jquery.ui.dialog.css",
                        "~/Content/themes/base/jquery.ui.slider.css",
                        "~/Content/themes/base/jquery.ui.tabs.css",
                        "~/Content/themes/base/jquery.ui.datepicker.css",
                        "~/Content/themes/base/jquery.ui.progressbar.css",
                        "~/Content/themes/base/jquery.ui.theme.css"));

            //Kendo Bundles
            bundles.Add(new ScriptBundle("~/bundles/KendoJS").Include(
                        "~/Content/kendo/js/jquery.min.js",
                        "~/Content/kendo/js/kendo.all.min.js",
                        "~/Content/kendo/js/kendo.aspnetmvc.min.js",
                        "~/Content//kendo/js/console.min.js",
                        "~/Content/kendo/js/prettify.min.js",                        
                        "~/Content/kendo/js/cultures/kendo.culture.es-CR.min.js"));

            bundles.Add(new StyleBundle("~/bundles/kendoCSS").Include(
                        "~/Content/kendo/css/kendo.common.min.css",
                        "~/Content/kendo/css/kendo.rtl.min.css",
                        //"~/Content/kendo/css/kendo.default.min.css",
                        "~/Content/kendo/css/kendo.skin.metro.css"));

           // BundleTable.EnableOptimizations = true;

        }
    }
}