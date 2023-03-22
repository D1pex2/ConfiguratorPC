using ConfiguratorPC.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConfiguratorPC
{
    public class Configurator
    {
        private MotherBoard motherBoard;

        public MotherBoard MotherBoard 
        { 
            get
            {
                return motherBoard;
            }
            set
            {
                motherBoard = value;
            }
        }

        private Processor processor;

        public Processor Processor 
        { 
            get 
            {
                return processor; 
            }
            set
            {
                processor = value;
            }
        }

        public List<Processor> CompatibleProcessors
        {
            get
            {
                var processors = Core.Context.Processors.ToList();
                if (MotherBoard != null)
                {
                    processors = MotherBoard.MemoryType.Processors.Where(p => p.IdSocket == MotherBoard.IdSocket).ToList();
                }
                return processors;
            }
        }

        public List<MotherBoard> CompatibleMotherBoards
        {
            get
            {
                var motherBoards = Core.Context.MotherBoards.ToList();
                if (Processor != null)
                {
                    motherBoards = Processor.MemoryTypes.SelectMany(mt => mt.MotherBoards).Where(m => m.IdSocket == Processor.IdSocket).ToList();
                }
                return motherBoards;
            }
        }
    }
}
