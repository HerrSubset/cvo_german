INTERMEDIATE_BASIC_FILES=noun_cards.txt varia_cards.txt 
INTERMEDIATE_CLOZE_FILES=verb_conjugation_cards.txt preposition_cards.txt

all: cards.txt cloze_cards.txt

# Basic cards
cards.txt: $(INTERMEDIATE_BASIC_FILES)
	cat $(INTERMEDIATE_BASIC_FILES) > cards.txt

noun_cards.txt: kapittel_01/substantive.txt
	./conversion/convert_nouns $< $@

varia_cards.txt: kapittel_01/varia.txt
	./conversion/convert_varia $< $@

preposition_cards.txt: kapittel_01/prepositions.txt
	./conversion/convert_prepositions $< $@

#verb_cards.txt: kapittel_01/verben.txt
#	./conversion/convert_verbs $< $@

# Cloze cards
cloze_cards.txt: $(INTERMEDIATE_CLOZE_FILES)
	cat $(INTERMEDIATE_CLOZE_FILES) > cloze_cards.txt

verb_conjugation_cards.txt: kapittel_01/irregular_verb_conjugation.txt
	./conversion/convert_verb_conjugation $< $@

clean:
	rm -f cards.txt cloze_cards.txt $(INTERMEDIATE_BASIC_FILES) $(INTERMEDIATE_CLOZE_FILES)

.PHONY: clean all
