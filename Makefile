INTERMEDIATE_FILES=noun_cards_substantive.txt adj_cards_adjective.txt verb_cards_verben.txt
cards.txt: $(INTERMEDIATE_FILES)
	cat $(INTERMEDIATE_FILES) > cards.txt

noun_cards_substantive.txt: kapittel_01/substantive.txt
	./conversion/convert_nouns $<

adj_cards_adjective.txt: kapittel_01/adjective.txt
	./conversion/convert_adjectives $<

verb_cards_verben.txt: kapittel_01/verben.txt
	./conversion/convert_verbs $<

clean:
	rm -f cards.txt $(INTERMEDIATE_FILES)

.PHONY: clean
