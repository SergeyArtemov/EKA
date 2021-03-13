using System;

    class Program
    {
        static int[] arr = { 1, 2, 3, 0, 4, 5 };
        static int N = arr.Length;
        static int M = 3; // перед запуском выставить необходимое значение M !!!
        static int res = 1;
        public static Act[] acts= { new Next(), new Stop() }; // создаем массив объектов
        
        static void Main(string[] args)
        {
            string[] str = { "no", "yes" };

            res = res * acts[1 - (uint)(N * M / (N * M - 0.1))].do_act(0);   //учтен случай M=0

            Console.WriteLine(str[(uint)((res*res)/(res*res-0.1))]);
        }

        public abstract class Act
        {
            public abstract int do_act(int i);
        }

        class Next : Act {
            public override int do_act(int i) {
                      return res*arr[i] *           // перемножаем последовательно элементы массива
                                         acts[(uint)((i+1) / M)].do_act(i+1); // рекурсия на следующий элемент массива
                     }
        }
        class Stop : Act {
            public override int do_act(int i) {
                    return res;     // выход из рекурсии
                    }
        }

}

