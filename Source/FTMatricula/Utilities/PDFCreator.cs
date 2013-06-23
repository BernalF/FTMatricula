using System;
using System.Collections.Generic;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using System.Globalization;

namespace FTMatricula.Utilities.Helper
{
    public class PDFCreator
    {
        // Set up the fonts to be used on the pages
        private Font _largeFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.BLACK);
        private Font _standardFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
        private Font _smallFont = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL, BaseColor.BLACK);

        public void BuildConstancy(string fileID, string StudentName, string StudentID, string CoordinatorName, string PlanName, List<string[]> CoursesList)
        {
            Document doc = null;

            try
            {
                // Initialize the PDF document
                doc = new Document();
                PdfWriter writer = PdfWriter.GetInstance(doc,
                    new System.IO.FileStream(System.IO.Directory.GetCurrentDirectory() + "\\" + fileID + "_Constancy.pdf",
                        System.IO.FileMode.Create));

                // Set the margins and page size
                this.SetStandardPageSize(doc);

                // Open the document for writing content
                doc.Open();

                // Add pages to the document

                List<PageParagraph> ParagraphArray = new List<PageParagraph>();

                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_CENTER, font = this._largeFont, ParagraphText = "CONSTANCIA\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_JUSTIFIED, font = this._standardFont, ParagraphText = "EL (LA) ESTUDIANTE " + StudentName + ", CEDULA " + StudentID + " ALUMNO(A) DE LA INSTITUCION, EN EL PROGRAMA DE: " + PlanName + ".\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_LEFT, font = this._standardFont, ParagraphText = "CURSO LAS SIGUIENTES ASIGNATURAS:\n\n" });


                this.AddPageParagraphs(doc, ParagraphArray);

                this.AddTable(doc, 
                    new string[] { "Curso", "Nombre", "Nota", "Horas", "Período", "Año" },
                    new float[] { 50, 200, 50, 50, 50, 50 },
                    new int[] { 1, 0, 1, 1, 1, 1 }, 
                    CoursesList);


                ParagraphArray = new List<PageParagraph>();
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_CENTER, font = this._standardFont, ParagraphText = "---------------------------------------ULTIMA LINEA ---------------------------------------\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_JUSTIFIED, font = this._standardFont, ParagraphText = "LA PRESENTE SE EXTIENDE EN CARTAGO, A SOLICITUD DEL INTERESADO(A) A LOS " + DateTime.Now.Day + " DIAS DEL MES DE " + DateTime.Now.ToString("MMMM", CultureInfo.CreateSpecificCulture("es")).ToUpper() + " DEL AÑO " + DateTime.Now.Year + ".\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_JUSTIFIED, font = this._standardFont, ParagraphText = "NOTA: LAS CALIFICACIONES SE AJUSTAN A LA ESCALA DE 0 A 100, SIENDO SETENTA LA NOTA MÍNIMA DE APROBACION.\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_JUSTIFIED, font = this._standardFont, ParagraphText = "EQUIVALENCIAS A = APROBADA, REC = RECONOCIDA, UBI = UBICACIÓN EC = EN CURSO, R = REPROBADA RT = RETIRO TOTAL\nMODALIDADES: A=ANUAL, B=BIMESTRAL, C=CUATRIMESTRAL, M=MENSUAL,  S=SEMESTRAL T=TRIMESTRAL\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_JUSTIFIED, font = this._standardFont, ParagraphText = "NOTA: LAS CALIFICACIONES SE AJUSTAN A LA ESCALA DE 0 A 100, SIENDO SETENTA LA NOTA MÍNIMA DE APROBACION.\n\n\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_CENTER, font = this._standardFont, ParagraphText = CoordinatorName +"\n\n" });
                ParagraphArray.Add(new PageParagraph { alignment = Element.ALIGN_CENTER, font = this._standardFont, ParagraphText = "COORDINADOR, " + PlanName + "\n\n" });
                
                this.AddPageParagraphs(doc, ParagraphArray);

            }
            catch (DocumentException dex)
            {
                // Handle iTextSharp errors
            }
            finally
            {
                // Clean up
                doc.Close();
                doc = null;
            }
        }



        /// <summary>
        /// Add the header page to the document.  This shows an example of a page containing
        /// both text and images.  The contents of the page are centered and the text is of
        /// various sizes.
        /// </summary>
        /// <param name="doc"></param>
        private void AddPageParagraphs(Document doc, List<PageParagraph> ParagraphArray)
        {
            foreach (var Paragraph in ParagraphArray)
            {
                this.AddParagraph(doc, Paragraph.alignment, Paragraph.font, new Chunk(Paragraph.ParagraphText));
            }
        }





        /// <summary>
        /// Set margins and page size for the document
        /// </summary>
        /// <param name="doc"></param>
        private void SetStandardPageSize(Document doc)
        {
            // Set margins and page size for the document
            doc.SetMargins(50, 50, 50, 50);
            // There are a huge number of possible page sizes, including such sizes as
            // EXECUTIVE, POSTCARD, LEDGER, LEGAL, LETTER_LANDSCAPE, and NOTE
            doc.SetPageSize(new Rectangle(PageSize.LETTER.Width,
                PageSize.LETTER.Height));
        }

        /// <summary>
        /// Add a paragraph object containing the specified element to the PDF document.
        /// </summary>
        /// <param name="doc">Document to which to add the paragraph.</param>
        /// <param name="alignment">Alignment of the paragraph.</param>
        /// <param name="font">Font to assign to the paragraph.</param>
        /// <param name="content">Object that is the content of the paragraph.</param>
        private void AddParagraph(Document doc, int alignment, Font font, IElement content)
        {
            Paragraph paragraph = new Paragraph();
            paragraph.SetLeading(0f, 1.2f);
            paragraph.Alignment = alignment;
            paragraph.Font = font;
            paragraph.Add(content);
            doc.Add(paragraph);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="doc"></param>
        /// <param name="tableHeaders"></param>
        /// <param name="tableRows"></param>
        private void AddTable(Document doc, string[] tableHeaders, float[] widths, int[] alignment, List<string[]> tableRows)
        {
            PdfPTable table = new PdfPTable(tableHeaders.Length);
            table.SetTotalWidth(widths);
            table.WidthPercentage = 100;

            
            for (int i = 0; i < tableHeaders.Length; i++)
            {
                PdfPCell cell = new PdfPCell(new Phrase(tableHeaders[i]));
                cell.HorizontalAlignment = 1; //0=Left, 1=Center, 2=Right
                table.AddCell(cell);
            }

            foreach (var row in tableRows)
            {
                for (int j = 0; j < row.Length; j++)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(row[j]));
                    cell.HorizontalAlignment = alignment[j];
                    table.AddCell(cell);
                }
            }

            doc.Add(table);
        }


    }

    public class PageParagraph
    {

        public Font font { get; set; }
        public int alignment { get; set; }
        public string ParagraphText { get; set; }


    }
}
