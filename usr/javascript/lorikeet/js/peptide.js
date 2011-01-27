/*
   Copyright (c) 2010 Vagisha Sharma

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.
*/

// -----------------------------------------------------------------------------
// Peptide sequence and modifications
// -----------------------------------------------------------------------------
Peptide.sequence;
Peptide.staticMods;
Peptide.varMods;
Peptide.ntermMod;
Peptide.ctermMod;

function Peptide(seq, staticModifications, varModifications, ntermModification, ctermModification) {
   
   Peptide.sequence = seq;
   Peptide.ntermMod = ntermModification;
   Peptide.ctermMod = ctermModification;
   Peptide.staticMods = [];
   if(staticModifications) {
      for(var i = 0; i < staticModifications.length; i += 1) {
         var mod = staticModifications[i];
         Peptide.staticMods[mod.aa.code] = mod;
      }
   }
   
   Peptide.varMods = [];
   if(varModifications) {
      for(var i = 0; i < varModifications.length; i += 1) {
         var mod = varModifications[i];
         Peptide.varMods[mod.position] = mod;
      }
   }
}


// index: index in the seq.
// If this is a N-term sequence we will get the neutral mass of the sequence up-to index (exclusive).
// If this is a C-term sequence we will get the neutral mass of the sequence starting from index (inclusive)
Peptide.getSeqMassMono = function _seqMassMono(seq, index, term) {
   
   var mass = 0;
   var aa_obj = new AminoAcid();
   if(seq) {
      if(term == "n") {
         for( var i = 0; i < index; i += 1) {
            var aa = aa_obj.get(seq[i]);
            mass += aa.mono;
         }
      }
      if (term == "c") {
         for( var i = index; i < seq.length; i += 1) {
            var aa = aa_obj.get(seq[i]);
            mass += aa.mono;
         }
      }
   }
   return _addModMasses(mass, seq, index, term);
}

Peptide.getSeqMassAvg = function _seqMassAvg(seq, index, term) {
   
   var mass = 0;
   var aa_obj = new AminoAcid();
   if(seq) {
      if(term == "n") {
         for( var i = 0; i < index; i += 1) {
            var aa = aa_obj.get(seq[i]);
            mass += aa.avg;
         }
      }
      if (term == "c") {
         for( var i = index; i < seq.length; i += 1) {
            var aa = aa_obj.get(seq[i]);
            mass += aa.avg;
         }
      }
   }
   
   return _addModMasses(mass, seq, index, term);
}

function _addModMasses(seqMass, seq, index, term) {
   
   var mass = seqMass;
   // add any terminal modifications
   if(term == "n" && Peptide.ntermMod)
      mass += Peptide.ntermMod;
   if(term == "c" && Peptide.ctermMod)
      mass += Peptide.ctermMod;

   // add any static modifications
   for(var i = 0; i < seq.length; i += 1) {
      var mod = Peptide.staticMods[seq[i]];
      if(mod)
         mass += mod.modMass;
   }
   
   // add any varible modifications
   if(term == "n") {
      for(var i = 0; i < index; i += 1) {
         var mod = Peptide.varMods[i+1]; // varMods index in the sequence is 1-based
         if(mod) {
            mass += mod.modMass;
         }
      }
   }
   if(term == "c") {
      for(var i = index; i < seq.length; i += 1) {
         var mod = Peptide.varMods[i+1]; // varMods index in the sequence is 1-based
         if(mod) {
            mass += mod.modMass;
         }
      }
   }
   return mass;
}


//-----------------------------------------------------------------------------
// Modification
//-----------------------------------------------------------------------------
function Modification(aminoAcid, mass) {
   this.aa = aminoAcid;
   this.modMass = mass;
}

function VariableModification(pos, mass, aminoAcid) {
   this.position = parseInt(pos);
   this.aa = aminoAcid;
   this.modMass = mass;
}



