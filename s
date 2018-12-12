using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;


namespace SodaCratev1_05
{
    class Bottle //Skapade denna klassen för att ha mina metoder i.
    {
        private string name; // Här har vi tre variablar som visar på namnen, typ av läsk samt priset för vår läsk. 2 x strings, 1 x integer.
        private string beverageType; //De är privata för att de enbart skall användas av klassen Bottle.
        private int price;

        public Bottle(string names, string beverageTypes, int prices)// Detta är en konstruktor som kommer att spara våra tre variablar (string, string och int).
        {
            name = names;
            beverageType = beverageTypes;
            price = prices;
        }

        public string Name // Dessa är satt till privata åtkomstdirektiv då vi enbart vill att metoderna get och set ska få tillgång till dem.
        {
            get
            {
                return this.name;
            }
            set
            {
                this.name = value; // Då inparametrarna inte kan döpas själv används nyckelordet "value" istället.
            }
        }
        public string BeverageType
        {
            get
            {
                return this.beverageType;
            }
            set
            {
                this.beverageType = value;
            }
        }
        public int Prices
        {
            get
            {
                return this.price;
            }
            set
            {
                this.price = value;
            }
        }

        class Sodacrate //Ny klass som kommer att innehålla information och metoder för vår crate.
        {
            private Bottle[] myCrate; // Skapar en vektor som ska innehålla klasser av namn bottles.
            private int numberOfBottles = 0; //Håller reda på antal flaskor
            private const int maxBottles = 24;

            public Sodacrate()
            {
                myCrate = new Bottle[25]; //Detta säger åt vår vektor att vi har 24 platser i craten då vi börjar räkna från "0".
            }

            public void Run()
            {
                Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");
                Console.WriteLine("|                             |");
                Console.WriteLine("|           WELCOME           |"); // Välkomnar användaren
                Console.WriteLine("|           TO THE            |");
                Console.WriteLine("|          SODACRATE          |");
                Console.WriteLine("|          SIMULATOR          |");
                Console.WriteLine("|                             |");
                Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");

                int temp = 0;
                do // Här skapar vi en do-while loop för att vi vill att loopen alltid ska åtminstone ska gå EN gång. 
                {
                    Console.WriteLine("\"----------------------------\"");
                    Console.WriteLine("| Pick an option in the menue |");
                    Console.WriteLine("|                             |");
                    Console.WriteLine("| >[1] Add soda to crate      |");
                    Console.WriteLine("| >[2] Check crate status     |");
                    Console.WriteLine("| >[3] Search crate           |"); // Vår meny med diverse val.
                    Console.WriteLine("| >[4] Sort crate             |");
                    Console.WriteLine("| >[5] View current value     |");
                    Console.WriteLine("|                             |");
                    Console.WriteLine("| >[0] Exit                   |");
                    Console.WriteLine("\"----------------------------\"");


                    temp = int.Parse(Console.ReadLine()); //för att ge användaren möjligheten att välja alternativ använder vi int.Parse
                    switch (temp)
                    {
                        case 1:
                            add_soda(); // Lägger till läsk i craten.
                            break;
                        case 2:
                            print_crate(); // Kollar vad som finns i vår crate.
                            break;
                        case 3:
                            find_soda(); // Låter användaren söka igen craten för innehåll.
                            break;
                        case 4:
                            sort_sodas(); // Sorterar innehållet.
                            break;
                        case 5:
                            calc_total(); // Räknar ut värdet av vår crate.
                            break;
                        case 0:
                            Console.WriteLine("Ending program.");//Avslutar programmet
                            break;
                        default:
                            Console.WriteLine("Invalid input!"); //Säger åt användaren att valet inte är accepterat.
                            break;
                            // Inte inkluderat val där användaren kan ersätta läsk i lådan eller ta bort.
                    }

                } while (temp != 0);
            }

            //private void replace_soda()
            //{
            //    int choice = 0;
            //    bool loop = true;

            //    do
            //    {
            //        Console.WriteLine("Which bottle would you like to replace? 1 - 24: ");
            //        try
            //        {
            //            choice = int.Parse(Console.ReadLine()) - 1;
            //        }
            //        catch (Exception ex)
            //        {
            //            Console.WriteLine("Invalid option. please try again.");
            //            Console.ReadLine();
            //            loop = true;
            //        }
            //    }
            //    if ()
            //}

            public void add_soda()
                {

                    Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");
                    Console.WriteLine("|     Choose your beverage!        |");
                    Console.WriteLine("|                                  |"); // Ger användaren möjligheten att välja läsk från 6 alternativ.
                    Console.WriteLine("|[1] Pepsi , Soda, 11kr            |");
                    Console.WriteLine("|[2] Coca-Cola , Soda, 12kr        |");
                    Console.WriteLine("|[3] Coors Light , Beer, 18kr      |");
                    Console.WriteLine("|[4] Fiji, Water , 13kr            |");
                    Console.WriteLine("|[5] Nocco , Energy drink , 22kr   |");
                    Console.WriteLine("|[6] Redbull , Energy drink , 25kr |");
                    Console.WriteLine("|                                  |");
                    Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");

                    //Console.WriteLine("[7] Randomize"); Ett val för att slumpa läsk som läggs till i craten.

               
                int temp = 0;

                while (!int.TryParse(Console.ReadLine(), out temp) || !(temp < 7 && temp > 0)) // Detta är en failsafe, ifall väljaren väljer något som är över 7 eller under 1 kommer följande kod att skrivas ut.
                    {
                        // Console.ForegroundColor = ConsoleColor.Red; <-- Blev nyfiken på att använda färg i programmet, men känner mig inte tillräckligt kompetent för att bruka detta ännu.
                        Console.WriteLine("Invalid input, please try again.");
                        // Console.ResetColor();
                }
                switch (temp) // Denna switch statementen kommer låta oss lägga till flaskor i vår crate
                {
                    case 1: //Om anändaren skriver in ett tal mellan 1 och 6, kommer följade cases att skriva ut deras WriteLines.
                        Console.WriteLine(">>> You choose Pepsi <<<");
                        myCrate[numberOfBottles] = new Bottle("Pepsi", "Soda", 11); // Här skapas en läsk med namnet Pepsi som kostar 11kr.
                        numberOfBottles++; // Denna funktion gör så att en läsk läggs in i craten varje gång den skapas.
                        break;
                    case 2:
                        Console.WriteLine(">>> You choose Coca-Cola <<<");
                        myCrate[numberOfBottles] = new Bottle("Coca-Cola", "Soda", 12);
                        numberOfBottles++;
                        break;
                    case 3:
                        Console.WriteLine(">>> You choose Coors Light <<<");
                        myCrate[numberOfBottles] = new Bottle("Coors Light", "Beer", 18);
                        numberOfBottles++;
                        break;
                    case 4:
                        Console.WriteLine(">>> You choose Fiji <<<");
                        myCrate[numberOfBottles] = new Bottle("Fiji", "Water", 13);
                        numberOfBottles++;
                        break;
                    case 5:
                        Console.WriteLine(">>> You choose Nocco <<<");
                        myCrate[numberOfBottles] = new Bottle("Nocco", "Energydrink", 22);
                        numberOfBottles++;
                        break;
                    case 6:
                        Console.WriteLine(">>> You choose Redbull <<<");
                        myCrate[numberOfBottles] = new Bottle("Redbull", "Energydrink", 25);
                        numberOfBottles++;
                        break;
                    default:
                        //Console.ForegroundColor = ConsoleColor.Red;         // Samma här, men med tid och kompetensbrist måste jag tyvärr hoppa detta.
                        Console.WriteLine("Invalid choice!");
                       // Console.ResetColor;
                        break;
                }   
                if (Equals(myCrate, 25))
                {
                    Console.WriteLine("Crate is full!");
                }

            }

            public void print_crate()
            {
                for (int i = 0; i < myCrate.Length; i++) // Skapar en for-loop för att programmet ska skriva ut innehållet i vår crate.
                {
                    if (myCrate[i] != null) 
                    {
                        Console.WriteLine("Index {0}. name: {1}, type: {2}, price: {3}", i, myCrate[i].Name, myCrate[i].BeverageType, myCrate[i].Prices);
                    }//Om platsen i craten är upptagen kommer den att skriva ut namn, läsk samt pris, annars visar den att platsen är tom.
                    else
                    {
                        Console.WriteLine("Empty.");
                    }
                }
            }
            public void find_soda()
            {
                string findItm; // Här skapar vi strings, en int och bool för att hjälpa oss hitta läsken som användaren skriver in och letar efter.
                string checkForItm;

                bool ifSame = true;
                int foundItm = 0;

                Console.WriteLine("Enter soda: "); //Ber användaren skriva in läsk
                findItm = Console.ReadLine().ToLower(); //använder ToLower för att konvertera input till lowercase, som raden nedan.

                for (int k = 0; k < numberOfBottles; k++) // Här går vi igenom den läsk som finns i vår crate. 
                {
                    ifSame = true;
                    checkForItm = myCrate[k].name.ToLower();

                    if ((findItm.Length < checkForItm.Length) || (findItm.Length > checkForItm.Length)) // Sen ser vi till denna bit, kollar vi ifall strängarna är av lika längd, vilket de inte kan vara .
                    {
                        ifSame = false;
                    }
                    else
                    {
                        for (int l = 0; l < findItm.Length; l++) // Så här tittar vi på längen av strängen
                        {
                            ifSame = (findItm[l] == checkForItm[l]) && (ifSame == true) ? true : false; //simplifierad ist för att skriva ut extra rader kod.
                        }

                    }
                    if (ifSame) // Stämmer bokstäverna kommer den att räkna upp antalet funna i vår crate.
                    {
                        foundItm++;
                    }
                }
                Console.WriteLine("We found {0} {1}s in our crate.", foundItm, findItm); // Här skriver vi ut resultatet till användaren, således "We found x-antal Pepsis in our crate".
            }

            public void sort_sodas() //Kommer att göra en bubbel sortering som efterfrågades.
            {
                Bottle[] temp = new Bottle[25];

                for (int outer = 0; outer < numberOfBottles; outer++) // Den första yttre loopen kommer gå igenom x-antal numberOfBottles 
                {
                    for (int inner = 0; inner < numberOfBottles - 1 - outer; inner++) // När vi sedan kör den inre loopen kommer denna gå igenom våra element för att jämföra dem
                    {
                        if (myCrate[inner].Prices > myCrate[inner + 1].Prices) // Istället för att jämföra längden av namn på läsken, kommer vi att jämföra priset. 
                        {                                            //Detta kommer resultera i att vi istället jämför priset på läsken. Som i textboken på s. 166-168 kommer det flytta på det högsta priset så att vårt lägsta pris hamnar överst.
                            temp[inner] = myCrate[inner + 1];           // Exempelvis {11, 13, 18, 22 och 23} (sorterat) från ex. {13, 18, 23, 22, 11}.
                            myCrate[inner + 1] = myCrate[inner];
                            myCrate[inner] = temp[inner];
                        }
                    }
                }
            }
            public void calc_total()
            {
                Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");
                Console.WriteLine("|             Total Value of your Crate               |");
                Console.WriteLine("\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\"");
                Console.WriteLine();

                int value = 0;

                    for (int z = 0; z < numberOfBottles; z++)
                    {
                        value += myCrate[z].Prices;
                    }
                    Console.WriteLine("The current value of the crate is {0} kr.", value); // Visar totala värdet av innehållet i craten.

            }
            class Program
            {
                public static void Main(string[] args)
                {
                    var sodacrate = new Sodacrate(); //Skapar ett objekt av klassen Sodacrate som heter sodacrate
                    sodacrate.Run();
                    Console.Write("Press any key to continue . . . ");
                    Console.ReadKey(true);
                }
            }
        }
    }
}


