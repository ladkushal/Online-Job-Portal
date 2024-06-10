using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JobPortal
{
    public class Utills
    {
        public static bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] validExtensions = { ".jpg", ".jpeg", ".png" };
            for (int i = 0;i<= validExtensions.Length; i++ )
            {
                if(fileName.Contains(validExtensions[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;

        }


        public static bool IsValidForResume(string fileName)
        {
            bool isValid = false;
            string[] validExtensions = { ".docx", ".pdf", ".doc" };
            for (int i = 0; i < validExtensions.Length; i++)
            {
                if (fileName.Contains(validExtensions[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }

    }
}