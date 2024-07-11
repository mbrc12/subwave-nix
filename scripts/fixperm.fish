for line in (find **/* -type d);
	chmod 775 $line;
end

for line in (find **/* -type f);
	chmod 664 $line;
end
