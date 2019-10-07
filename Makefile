INTERMEDIATE_FILES=noun_cards_substantive.txt varia_cards_varia.txt verb_cards_verben.txt
cards.txt: $(INTERMEDIATE_FILES)
	cat $(INTERMEDIATE_FILES) > cards.txt

noun_cards_substantive.txt: kapittel_01/substantive.txt
	./conversion/convert_nouns $<

varia_cards_varia.txt: kapittel_01/varia.txt
	./conversion/convert_varia $<

verb_cards_verben.txt: kapittel_01/verben.txt
	./conversion/convert_verbs $<

clean:
	rm -f cards.txt $(INTERMEDIATE_FILES)

.PHONY: clean
