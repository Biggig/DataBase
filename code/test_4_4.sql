select *
from CHOICES
where CHOICES.score<=all
(select score
from CHOICES
where score is not null
)
