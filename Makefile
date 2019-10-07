INTERMEDIATE_FILES=noun_cards.txt varia_cards.txt verb_cards.txt
cards.txt: $(INTERMEDIATE_FILES)
	cat $(INTERMEDIATE_FILES) > cards.txt

noun_cards.txt: kapittel_01/substantive.txt
	./conversion/convert_nouns $< $@

varia_cards.txt: kapittel_01/varia.txt
	./conversion/convert_varia $< $@

verb_cards.txt: kapittel_01/verben.txt
	./conversion/convert_verbs $< $@

clean:
	rm -f cards.txt $(INTERMEDIATE_FILES)

.PHONY: clean
